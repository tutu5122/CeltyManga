class CarritoController < ApplicationController
  before_action :authenticate_user!

  def show
    @orden_compras = OrdenCompra.all
    @detalle_compras = DetalleCompra.all
  end
end
