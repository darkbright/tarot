class CreateYearCards < ActiveRecord::Migration
  def change
    create_table :year_cards do |t|
      t.integer :no
      t.string :title
      t.text :comment
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :year_cards, :people
  end
end
