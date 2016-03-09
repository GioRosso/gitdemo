class OrdersController < ApplicationController
    
  before_action :authorize
  
  def index
      @order = Order.where(user_id: params[:user_id])
  end
  
    
  def new
  @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    # @order.user_id = loddeg_in_user.id
    @order.user = logged_in_user
  
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end
  
  private
  
  def order_params
      params.require(:order).permit(:product_id, :quantity)
  end
  
end