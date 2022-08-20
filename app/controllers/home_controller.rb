class HomeController < ApplicationController
  def index
      @productos = Producto.all
      
  end
  
  def search   
    @productos = Producto.where("titulo LIKE ?", "%#{params[:q]}%")    
  end


end
