class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :user_id
      t.text :description
      t.string :rating

      t.timestamps null: false
    end
  end
end
