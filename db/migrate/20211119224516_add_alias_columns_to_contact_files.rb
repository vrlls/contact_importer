class AddAliasColumnsToContactFiles < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_files, :alias_name, :string, default: "name"
    add_column :contact_files, :alias_date_of_birth, :string, default: "date_of_birth"
    add_column :contact_files, :alias_phone, :string, default: "phone"
    add_column :contact_files, :alias_address, :string, default: "address"
    add_column :contact_files, :alias_credit_card, :string, default: "credit_card"
    add_column :contact_files, :alias_franchise, :string, default: "franchise"
    add_column :contact_files, :alias_email, :string, default: "email"
    add_column :contact_files, :status, :string
  end
end
