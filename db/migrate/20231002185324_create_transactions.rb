class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :author_id
      t.string :name
      t.decimal :amount
	  t.references :category, foreign_key: true
      t.integer :category_id

      t.timestamps
    end
  end
end
