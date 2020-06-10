class StoresController < ApplicationController
  before_action :set_cart, only: [:show, :cart, :sell]
  before_action :set_shipping, only: [:sell, :shipping, :saveship, :savesell]
  before_action :set_payment, only: [:sell, :payment, :savepay, :savesell]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Medicament.all
  end

  def show
    @product = Medicament.find_by(id: store_params[:medicament_id])
    @carro = Cart.find_by(patient: current_patient)
    if CartDetail.find_by(cart: @carro, medicament: @product)
      insertar= CartDetail.find_by(cart: @carro, medicament: @product)
    else
      insertar= CartDetail.new
    end
    insertar.cart = Cart.find_by(patient: current_patient)
    insertar.medicament = @product
    if store_params[:quantity] != nil && store_params[:quantity] > "0"
      insertar.quantity = store_params[:quantity]
      if insertar.save
        flash[:notice] = "Agregado al carrito."
        redirect_to stores_path
      end
    else
      flash[:notice] = "El producto debe ser mayor a 0."
      redirect_to stores_path
    end
  end

  def cart
    @carrito = CartDetail.where(cart: @cart)
  end

  def shipping
    if CartDetail.find_by(cart: @cart) != nil
      redirect_to root_path
    end
  end

  def saveship
    if @envio.update(ship_params)
      redirect_to payment_path
    end
  end

  def payment
    if CartDetail.find_by(cart: @cart) != nil
      redirect_to root_path
    end
  end

  def savepay
    if @pago.update(pay_params)
      redirect_to sell_path
    end
  end

  def sell
    if !CartDetail.find_by(cart: @cart)
      redirect_to root_path
    end
    @carrito = CartDetail.where(cart: @cart)
  end

  def savesell
    @cart = Cart.find_by(patient: current_patient)
    @carrito = CartDetail.where(cart: @cart)
    @total = 222
    @carrito.each do |cart|
      @total = @total + (cart.medicament.price) * (cart.quantity)
    end
    @cart = Cart.find_by(patient: current_patient)
    @sell = Sell.new
    @sell.patient = @cart.patient
    @sell.shipping = @envio
    @sell.payment = @pago
    @sell.total = @total
    if @sell.save
      @carrito.each do |cart|
        @selld = SellDetail.new
        @selld.sell = @sell
        @selld.medicament = cart.medicament
        @selld.quantity = cart.quantity
        @selld.save
      end
      @carrito.each do |cart|
        cart.destroy
      end
      @cart.destroy
      flash[:notice] = "Su compra se realizo correctamente, gracias."
      redirect_to root_path
    end
  end

  def quitaritem
    carrito = CartDetail.find(params[:cart])
    carrito.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'El objeto se elimino del carrito', method: :post }
      format.json { head :no_content }
    end
  end

  private
  def set_cart
    if !patient_signed_in?
      redirect_to root_path
    end
    if Cart.find_by(patient: current_patient)
      @cart = Cart.find_by(patient: current_patient)
    else
      @cart = Cart.new
      @cart.patient = current_patient
      @cart.save
    end
  end
  private
  def set_shipping
    @envio = Shipping.find_by(patient: current_patient)
    if @envio == nil
      @envio = Shipping.new
      @envio.patient = current_patient
      @envio.save
    end
  end
  private
  def set_payment
    @pago = Payment.find_by(patient: current_patient)
    if @pago == nil
      @pago = Payment.new
      @pago.patient = current_patient
      @pago.save
    end
  end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:algo).permit(:medicament_id, :quantity)
    end
    def ship_params
      params.require(:algo).permit(:name,:lastname,:city, :state, :country, :postal_code, :detail)
    end
    def pay_params
      params.require(:algo).permit(:name,:lastname,:number, :secret_code, :exdate)
    end
end
