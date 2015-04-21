class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  attr_accessible :nickname, :name, :file_number, :email, :provider, :uid, :group_id, :course_id


  validates :nickname, presence: true
  validates :name, presence: true
  validates :file_number, presence: true, uniqueness: true
  validates :course, presence: true
  validates :group, presence: true
  validate :group_belongs_to_course
  #validates :provider, uniqueness: true
  #validates :uid, uniqueness: true

  #
  #Relationships
  #
  belongs_to :course
  belongs_to :group

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"]
        user.email = data["info"]["email"] if user.email.blank?
        user.name = data["info"]["name"] if user.name.blank?
        user.nickname = data["info"]["nickname"]
        user.password = data["password"] if user.password.blank?
        user.password_confirmation = user.password
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
        user.course_id = params["course_id"]
        user.group_id = params["group_id"]
        user.file_number = params["file_number"]
      end
    end
  end

  def group_belongs_to_course
    if group.present? && course.present? && course.groups.none?{|g| g.id == group.id}
      errors.add(:group, "can't be of another course")
    end
  end
end
