class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :currency_name
      t.string :currency_code
      t.timestamps
    end
  end
end
