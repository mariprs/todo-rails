class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :subtitle
      t.boolean :completed
      t.references :list_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
