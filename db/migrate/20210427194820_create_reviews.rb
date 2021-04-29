class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :vehicle_name
      t.date :date_rented
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
