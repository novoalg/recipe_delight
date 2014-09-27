class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :item_id
      t.integer :author_id
      t.string :preptime
      t.string :cooktime
      t.integer :review_id
      t.integer :score

      t.timestamps
    end
  end
end
