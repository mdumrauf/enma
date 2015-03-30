class Course < ActiveRecord::Base
  attr_accessible :code

  #
  # Relationships
  #
  has_many :users, dependent: :destroy
  has_many :groups, dependent: :destroy


  #
  # Validations
  #
  validates :code, presence: true

  #
  # Class methods
  #
  def self.ordered_by_id
    Course.order(:id)
  end
end
