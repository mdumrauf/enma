class Group < ActiveRecord::Base
  #
  # Relationships
  #
  has_many :users
  belongs_to :course

  #
  # Validations
  #
  validates :course, presence: true
  validates :name, presence: true

  #
  #Class methods
  #
  def self.ordered_by_name
    Group.order(:name)
  end
end
