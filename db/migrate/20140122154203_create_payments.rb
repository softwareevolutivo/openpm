class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :expiration_date, null: false
      t.date :cancellation_date
      t.string :invoice_number
      t.decimal :amount, precision: 5, scale: 2, null: false
      t.decimal :distributable_amount, precision: 5, scale: 2, null: false
      t.string :status, null: false
      t.string :origin, null: false
      t.text :notes

      t.timestamps
    end
  end
end
