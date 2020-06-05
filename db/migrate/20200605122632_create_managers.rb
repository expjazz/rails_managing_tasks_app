class CreateManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers do |t|

      t.timestamps
    end
  end
end
