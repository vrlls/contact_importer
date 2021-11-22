class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.date :date_of_birth, null: false
      t.string :phone, null: false
      t.string :address, null: false 
      t.references :credit_card, null: false, foreign_key: true
      t.string :franchise, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
