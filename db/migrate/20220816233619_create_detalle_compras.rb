class CreateDetalleCompras < ActiveRecord::Migration[6.1]
  def change
    create_table :detalle_compras do |t|
      t.integer :cantidad
      t.references :orden_compra, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
