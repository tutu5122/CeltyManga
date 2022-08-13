json.extract! cliente, :id, :rut, :nombre, :apellido, :email, :direccion, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
