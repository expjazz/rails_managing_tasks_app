class AddProjectIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :project_id, :integer
  end
end
