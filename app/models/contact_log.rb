class ContactLog < ApplicationRecord
  belongs_to :user

  validates :elements, presence: true
  validates :error, presence: true
end
