class OrdersController < ApplicationController
  include ActionController::Live
  before_action :authorize
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:edit, :update, :index]




  def authorize_admin
      redirect_to root_path unless current_user.admin == true
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @cart = current_cart
    @user = current_user
    params[:box_id] = @box_id
    @order = Order.new(box_id: params[:box_id])
    lastBox = Box.last.id
    @box = Box.find(params = lastBox)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart = current_cart
    @user = current_user

  end

  # GET /orders/new
  def new
    params[:box_id] = @box_id
    @order = Order.new(box_id: params[:box_id])
    lastBox = Box.last.id
    @box = Box.find(params = lastBox)

    @cart = current_cart
    @user = current_user
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = current_user
    @cart = current_cart
    @box = current_user.boxes.last.id
    @order = current_user.orders.build(order_params)
    
    @amount = 500
    

    respond_to do |format|
      if @order.save
    
        @user.incre(:user_calories, @order.total_calories)
        @user.incre(:user_proteins, @order.total_proteins)
        @user.incre(:user_carbs, @order.total_carbs)
        @user.incre(:user_water, @order.total_water)
        @user.incre(:user_land, @order.total_land)
        @user.incre(:user_carbon, @order.total_carbon)
        @user.incre(:user_lives, @order.total_lives)
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.js
        format.html { redirect_to @order, notice: 'Order was successfully placed. See what you saved.' }
        format.json { render :show, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def all_orders
      @orders = Order.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :order_status, :box_id)
    end
end
