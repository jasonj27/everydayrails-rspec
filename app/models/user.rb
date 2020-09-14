class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :projects

  def name
    [first_name, last_name].join(" ")
  end
end
