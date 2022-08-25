class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :rut
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :direccion
      t.boolean :superuser

      t.timestamps
    end
  end
end
