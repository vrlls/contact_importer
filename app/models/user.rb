class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :contact_files
  has_many :contacts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
