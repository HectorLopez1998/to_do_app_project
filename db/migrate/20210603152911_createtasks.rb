class Createtasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    t.string :title
    t.text :description
    t.timestamps null: false
  end
  end
end
