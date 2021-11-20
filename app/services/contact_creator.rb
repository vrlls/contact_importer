class ContactCreator < ApplicationService
  require 'csv'

  attr_accessor :params, :file

  def initialize(params)
    binding.pry
    @params = params
    @contact_file = ContactFile.find(params)
    @file = CSV.parse(@contact_file.csv.download, headers: true)
  end

  def call
    @contact_file.update(status: "Processing")
    Contact.transaction do
      file.each do |row|
        binding.pry
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
      end
    end
  end

  private

  def contact_hashes
    @file.map {|a| Hash[@file.headers.zip a.fields] }
  end
end
