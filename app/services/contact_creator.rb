class ContactCreator < ApplicationService
  require 'csv'

  attr_accessor :params, :file

  def initialize(params)

    @params = params
    @contact_file = ContactFile.find(params)
    @file = CSV.parse(@contact_file.csv.download, headers: true)
  end

  def call
    cont = 0
    @contact_file.update(status: "Processing")
    Contact.transaction do
      unless file.empty?
        file.each do |row|
          begin
            contact = Contact.new
            contact.name = row[@contact_file.alias_name]
            contact.date_of_birth = row[@contact_file.alias_date_of_birth]
            contact.phone = row[@contact_file.alias_phone]
            contact.credit_card = row[@contact_file.alias_credit_card]
            contact.email = row[@contact_file.alias_email]
            contact.address = row[@contact_file.alias_address]
            contact.franchise = ""
            contact.user = User.find(@contact_file.user.id)
            contact.save!
            cont += 1
          rescue => e
            ContactLog.create!(elements: row.to_s, error: e.to_s, user: User.find(@contact_file.user.id))
          end
        end
        @contact_file.update(status: "Finished")
      else
        @contact_file.update(status: "Finished")
      end
    end
    @contact_file.update(status: "Failed") if cont == 0
  end
end
