class CreateExecutions < ActiveRecord::Migration
  def change
    create_table :executions do |t|
      t.integer :snippet_id
      t.text :stdout
      t.text :stderr
      t.integer :exit_status
      t.string :status

      t.timestamps
    end
  end
end
