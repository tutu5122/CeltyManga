# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genero.create(nombre: 'terror')
Genero.create(nombre: 'comedia')
Genero.create(nombre: 'romance')
Genero.create(nombre: 'accion')


40.times do
    producto = Producto.create(titulo: 'Manga n' + (1..25).to_a.sample.to_s, total_stock: (1..25).to_a.sample, descripcion: 'Hola descripcion', precio: (1000..8000).to_a.sample ,url: (1..5).to_a.sample.to_s + '.jpg' , genero_id: (1..4).to_a.sample )
end


cliente = Cliente.create(rut: '11111111-1', nombre: 'Maria', apellido: 'Perez' , email: 'nada@nada.cl' , direccion: 'Calle 445 La Florida, Santiago', superuser: false)
user = User.create(email: 'nada@nada.cl', password: '123123', password_confirmation: '123123')

cliente = Cliente.create(rut: '22222222-2', nombre: 'Super Usuario', apellido: 'Super' , email: 'super@super.cl' , direccion: 'Calle 123 Puente Alto, Santiago', superuser: true)
user = User.create(email: 'super@super.cl', password: '123123', password_confirmation: '123123')


AdminUser.create!(email: 'admin@example.com', password: '123123', password_confirmation: '123123')
