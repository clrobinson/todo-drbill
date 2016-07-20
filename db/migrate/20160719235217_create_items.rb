class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :content, null: false
      t.datetime :due_date
      t.boolean :done, default: false
      t.references :list, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
