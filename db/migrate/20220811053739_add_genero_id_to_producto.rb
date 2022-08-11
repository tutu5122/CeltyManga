class AddGeneroIdToProducto < ActiveRecord::Migration[6.1]
  def change
    add_reference :productos, :genero, null: false, foreign_key: true
  end
end
