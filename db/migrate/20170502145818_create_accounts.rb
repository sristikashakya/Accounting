class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
		t.date :date
		t.string :title
		t.integer :amount
		t.timestamps null: false
	end
  end
end
