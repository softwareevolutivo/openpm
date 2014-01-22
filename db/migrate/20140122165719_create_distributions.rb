class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :concept, null: false
      t.decimal :amount, precision: 5, scale: 2, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
