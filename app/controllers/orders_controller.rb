class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  @test_variable_with_at_mark = "test variable with @ mark in in orders_controller.rb"
  test_variable = "test variable in orders_controller.rb"


  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    #till here original
    #----------------------------

    #@test_variable01 = "test variable"

if @order != nil then

    line_items = @order.line_items.includes(:pumpkin)
    li_pumpkin_pairs02 = line_items.map { |li| [li, li.pumpkin] }

      li_pumpkin_pairs02.each do |line_item,pumpkin|
      #@sum += line_item.price
      @sum = "abc"
    end
end

  end


  # GET /orders/1
  # GET /orders/1.json
  def show
    line_items = @order.line_items.includes(:pumpkin)
    @li_pumpkin_pairs = line_items.map { |li| [li, li.pumpkin] }

    #till here original
    #-------------------


#    @li_pumpkin_pairs.each do |line_item,pumpkin|
#      if !line_item.price.nil?
#        @sum =+  line_item.price
#      end
#    end

#    @sum01 = 0
#    @li_pumpkin_pairs.each do |line_item,pumpkin|
#      if !line_item.price.nil?
#        @sum01 = @sum01 + 1
#      end
#   end

      @order.each |o|
      @sum =+ o.line_items.price


#    @li_pumpkin_pairs.each do |line_item,pumpkin|
#      @sum =+ line_item.amount * pumpkin.price
#    end



    #一応エラーはでない。正しくはない。
    # @sum = line_items.values.inject(:+)

    #こうすると、@li_pumpkin_pairsの中身が表示される
    #@sum = @li_pumpkin_pairs

  end



  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
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
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id)
    end
end
