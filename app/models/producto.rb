class Producto < ApplicationRecord
    belongs_to :genero
    paginates_per 20

end
