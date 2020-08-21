class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :foodname
      t.string :category
      t.belongs_to :eater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
