class CreateCriptos < ActiveRecord::Migration[7.1]
  def change
    create_table :criptos do |t|
      t.string :moneda
      t.decimal :interes_mensual
      t.decimal :balance_ini

      t.timestamps
    end
  end
end
