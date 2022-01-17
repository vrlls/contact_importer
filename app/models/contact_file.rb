class ContactFile < ApplicationRecord
  belongs_to :user

  after_create_commit :generate_contacts
  
  has_one_attached :csv

  private
  
  def generate_contacts
    self.update(status: "On Hold")
    ImportContactJob.perform_later(id)

  end
end
