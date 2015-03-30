class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  attr_accessible :name, :file_number, :email, :provider, :uid


  validates :name, presence: true
  validates :file_number, presence: true, uniqueness: true
  #validates :provider, uniqueness: true
  #validates :uid, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
    end
  end

  def self.new_with_session(params, session)

    super.tap do |user|
      if data = session["devise.github_data"] #&& session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["info"]["email"] if user.email.blank?
        user.name = data["info"]["name"] if user.name.blank?
        user.password = data["password"] if user.password.blank?
        user.password_confirmation = user.password
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
      end
    end
  end


end
