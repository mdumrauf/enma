class Course < ActiveRecord::Base
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
  def self.ordered_by_code
    Course.order(:code)
  end
end
