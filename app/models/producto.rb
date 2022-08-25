class Producto < ApplicationRecord
    has_many :detalle_compras
    belongs_to :genero
    paginates_per 20

end
