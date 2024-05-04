class AddFParamsToQueries < ActiveRecord::Migration[7.1]
  def change
    add_column :queries, :Fparams, :string
  end
end
