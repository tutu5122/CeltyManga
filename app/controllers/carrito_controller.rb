class CarritoController < ApplicationController
  def show
    @orden_compras = OrdenCompra.all
    @detalle_compras = DetalleCompra.all
  end
end
