class Group < ActiveRecord::Base
  attr_accessible :course, :name

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
  def self.ordered_id
    Group.order(:id)
  end
end
