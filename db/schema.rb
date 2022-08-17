# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_16_233619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "rut"
    t.string "nombre"
    t.string "apellido"
    t.string "email"
    t.string "direccion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "detalle_compras", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "orden_compra_id", null: false
    t.bigint "producto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orden_compra_id"], name: "index_detalle_compras_on_orden_compra_id"
    t.index ["producto_id"], name: "index_detalle_compras_on_producto_id"
  end

  create_table "generos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orden_compras", force: :cascade do |t|
    t.integer "total"
    t.string "direccion_despacho"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_orden_compras_on_cliente_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "titulo"
    t.integer "total_stock"
    t.string "descripcion"
    t.integer "precio"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "genero_id", null: false
    t.index ["genero_id"], name: "index_productos_on_genero_id"
  end

  add_foreign_key "detalle_compras", "orden_compras"
  add_foreign_key "detalle_compras", "productos"
  add_foreign_key "orden_compras", "clientes"
  add_foreign_key "productos", "generos"
end
