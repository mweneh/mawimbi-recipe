class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :foodname
      t.string :image
      t.string :description
      t.string :ingredients
      t.string :tutorial
      t.string :country
      t.string :servings
      t.string :instructions
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
