class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :titulo
      t.integer :total_stock
      t.string :descripcion
      t.integer :precio
      t.string :url

      t.timestamps
    end
  end
end
