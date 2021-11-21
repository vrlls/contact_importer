class ContactFile < ApplicationRecord
  belongs_to :user

  after_create_commit :generate_contacts
  
  has_one_attached :csv

  private
  
  def generate_contacts
    self.update(status: "On Hold")
    if ContactCreator.new(id).call > 0
      self.update(status: "Finished")
    else
      self.update(status: "Failed")
    end
  end
end
