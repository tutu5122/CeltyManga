class DetalleCompra < ApplicationRecord
  belongs_to :orden_compra
  belongs_to :producto


end
