class BoxesController < ApplicationController
  skip_before_action :authorize
  before_action :set_box, only: [:show, :edit, :update, :destroy]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all
    @user = current_user
    @cart = current_cart
  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show
    @user = current_user
    @cart = current_cart
  end

  # GET /boxes/new
  def new
    @box = Box.new
    @user = current_user
    @cart = current_cart
  end

  # GET /boxes/1/edit
  def edit
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @user = current_user
    @cart = current_cart
    @box = current_user.boxes.build(box_params)
    finalPrice = @box.product.price
    @box.set_box_price(:box_price, finalPrice)

    respond_to do |format|
      if @box.save
        format.html { redirect_to new_order_path, notice: 'Box was successfully created.' }
        format.json { render :show, status: :created, location: @box }
      else
        format.html { render :new }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxes/1
  # PATCH/PUT /boxes/1.json
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
        format.json { render :show, status: :ok, location: @box }
      else
        format.html { render :edit }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_url, notice: 'Box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def box_params
      params.require(:box).permit(:product_id, :box_price)
    end
end
