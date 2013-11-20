class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :name
      t.string :description
      t.string :state
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
