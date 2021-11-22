class ContactFile < ApplicationRecord
  has_one_attached :csv
  belongs_to :user
end
