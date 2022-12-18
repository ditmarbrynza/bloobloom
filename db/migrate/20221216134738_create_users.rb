class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.integer :role, null: false
      t.belongs_to :currency, null: false, foreign_key: true, on_delete: :nullify
      t.string :api_token, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
