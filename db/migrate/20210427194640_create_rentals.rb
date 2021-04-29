class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.date :pickup_date
      t.date :dropoff_date
      t.string :message

      t.timestamps
    end
  end
end
