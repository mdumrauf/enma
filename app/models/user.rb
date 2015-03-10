class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :lastname, :file_number, :email, :password, :password_confirmation


  validates :name, presence: true
  validates :lastname, presence: true
  validates :file_number, presence: true, uniqueness: true
end
