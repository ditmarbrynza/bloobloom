class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses do |t|
      t.belongs_to :frame, null: false, foreign_key: true, on_delete: :nullify
      t.belongs_to :lense, null: false, foreign_key: true, on_delete: :nullify
      t.belongs_to :user, null: false, foreign_key: true, on_delete: :cascade
      t.decimal :price, precision: 12, scale: 6
      t.belongs_to :currency, null: false, foreign_key: true, on_delete: :nullify
      t.timestamps
    end
  end
end
