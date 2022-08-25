class OrdenCompra < ApplicationRecord
  has_many :detalle_compras
  belongs_to :cliente

end
