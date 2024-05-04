class CreateQueries < ActiveRecord::Migration[7.1]
  def change
    create_table :queries do |t|
      t.text :query
      t.integer :amount

      t.timestamps
    end
  end
end
