class CreditCard < ApplicationRecord

  belongs_to :contact

  validate :number, presence: true
  validate :franchise, presence: true
end
