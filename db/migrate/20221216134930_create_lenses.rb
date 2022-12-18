class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|
      t.string :color, null: false
      t.string :description, null: false
      t.integer :prescription_type, null: false
      t.integer :lens_type, null: false
      t.integer :stock, null: false
      t.decimal :price, precision: 12, scale: 6
      t.belongs_to :currency, null: false, foreign_key: true, on_delete: :nullify
      t.timestamps
    end
  end
end
