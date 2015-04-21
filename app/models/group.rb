class Group < ActiveRecord::Base
  attr_accessible :course, :code

  #
  # Relationships
  #
  has_many :users
  belongs_to :course

  #
  # Validations
  #
  validates :course, presence: true
  validates :code, presence: true

  #
  #Class methods
  #
  def self.ordered_by_id
    Group.order(:id)
  end
end
