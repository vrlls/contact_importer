class Contact < ApplicationRecord
  belongs_to :user

  after_create :set_franchise

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
