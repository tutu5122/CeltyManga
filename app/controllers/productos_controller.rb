class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ]
  before_action :set_generos, only: %i[ new create edit ]

  $productos_en_carro = []
  
  # GET /productos or /productos.json
  def index
    #@productos = Producto.all
    @productos = Producto.page(params[:page]) 
  end

  def search   
    @productos = Producto.where("titulo LIKE ?", "%#{params[:q]}%")  

  end

  # GET /productos/1 or /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos or /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to producto_url(@producto), notice: "Producto fue creado." }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to producto_url(@producto), notice: "Producto fue actualizado." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url, notice: "Producto fue eliminado." }
      format.json { head :no_content }
    end
  end

  
  def agregar_carro
   
    @producto = params.require(:productos).permit(:id, :precio, :titulo, :cantidad) 
    $productos_en_carro.push( @producto )
    respond_to do |format|
      format.html { redirect_to productos_url, notice: "Se agrego al carrito." }
      format.json { head :no_content }
    end
  end

  def mandar_carro

    @infoOrden = params.require(:productos).permit(:despacho, :email)

    @total = 0
    $productos_en_carro.each do |carro|
      @total = @total + (carro[:cantidad].to_i * carro[:precio].to_i)
    end

    @cliente = Cliente.find{|c| c[:email] == @infoOrden[:email]}
   
    orden = OrdenCompra.create(total: @total, direccion_despacho: @infoOrden[:despacho], cliente_id: @cliente[:id] )

   
    $productos_en_carro.each do |carro|
      detalle = DetalleCompra.create(cantidad: carro[:cantidad] , orden_compra_id: orden.id, producto_id: carro[:id])
    end
    
    $productos_en_carro = []
    redirect_to carrito_show_url
  end

  def  eliminar_del_carro
    @id = params.require(:productos).permit(:id) 

    @productoBorrar = $productos_en_carro.find{|e| e[:id] == @id[:id] }
    $productos_en_carro.delete(@productoBorrar)

    respond_to do |format|
      format.html { redirect_to productos_url, notice: "Se elimino elemento del carrito." }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    def set_generos
      @generos = Genero.pluck(:nombre, :id)
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:titulo, :total_stock, :descripcion, :precio, :url, :genero_id)
    end

end
