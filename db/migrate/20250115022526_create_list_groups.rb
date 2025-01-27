class CreateListGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :list_groups do |t|
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
