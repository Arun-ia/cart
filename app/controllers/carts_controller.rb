class CartsController < ApplicationController
  before_action :set_cart, only: [ :edit, :update, :destroy]
  # GET /carts
  # GET /carts.json
  def index
   @net_amount = 0
    @products = Product.all
    @carts = Cart.all
    
  end


  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(create_cart_params)
    puts @cart.quantity
    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_url, notice: 'Item added to the cart.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { redirect_to carts_url}
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_url, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_cart_params
      params.permit(:quantity,:Product_id)
    end
    def cart_params
      params.require(:cart).permit(:quantity,:Product_id)
    end
end
