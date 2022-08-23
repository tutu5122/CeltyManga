class Producto < ApplicationRecord
    has_many :detalle_compras
    belongs_to :genero
    belongs_to :user
    paginates_per 20

end
