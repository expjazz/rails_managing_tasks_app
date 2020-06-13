class AddFunctionToManagers < ActiveRecord::Migration[6.0]
  def change
    add_column :managers, :function, :string
  end
end
