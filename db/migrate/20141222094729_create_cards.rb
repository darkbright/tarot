class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.date :birth
      t.integer :soulcard
      t.integer :sunsign
      t.integer :moonsign
      t.integer :minorsoulcard
      t.integer :zodiaccard
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :cards, :people
  end
end
