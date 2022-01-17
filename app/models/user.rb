class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :contact_files
  has_many :contacts
  has_many :contact_logs

  validates :email, presence: true
  validates :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
