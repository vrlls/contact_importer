class CreateContactLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_logs do |t|
      t.text :elements
      t.string :error
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
