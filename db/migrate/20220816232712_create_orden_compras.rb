class CreateOrdenCompras < ActiveRecord::Migration[6.1]
  def change
    create_table :orden_compras do |t|
      t.integer :total
      t.string :direccion_despacho
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
