class Contact < ApplicationRecord
  belongs_to :user

  after_create :set_franchise

  validates :name, presence: true, format: { with: /-*\w+-*\w+-*/ }
  validates :date_of_birth, presence: true, format: { with: /\d{4}-?\d{2}-?\d{2}/}
  validates :phone, presence: true, format: { with: /(\({1}\+{1}\d{2}\){1})\s?-?(\d{3})\s?-?(\d{3})\s?-?(\d{2})\s?-?(\d{2})/}
  validates :address, presence: true
  validates :credit_card, presence: true, credit_card_number: true

  encrypts :credit_card

  def get_credit_card
    number = self.credit_card
    digits = number.length
    number[0..digits-5] = "**** **** "
    number
  end

  private

  def set_franchise
    detector = CreditCardValidations::Detector.new(credit_card)
    self.update(franchise: detector.brand.to_s)
  end
end
