json.extract! producto, :id, :titulo, :total_stock, :descripcion, :created_at, :updated_at
json.url producto_url(producto, format: :json)
