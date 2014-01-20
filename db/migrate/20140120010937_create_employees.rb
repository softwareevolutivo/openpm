class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email, null: false
      t.string :identification, null: false
      t.string :name, null: false
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
