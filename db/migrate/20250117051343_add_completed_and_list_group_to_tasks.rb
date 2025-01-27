class AddCompletedAndListGroupToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :completed, :boolean, default: false unless column_exists?(:tasks, :completed)
    add_reference :tasks, :list_group, foreign_key: true unless column_exists?(:tasks, :list_group_id)
  end
end
