class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number, :null => false
      t.string :franchise, :null => false, :default => ""

      t.timestamps
    end
  end
end
