class OrdersController < ApplicationController
  before_action :authenticate

  def index
    # only get orders for the logged in server
    @orders = Order.all
    # get all menu items
    @menus = Menu.all
    # get all parties
    @parties = Party.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to orders_path
    else
      redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(:party_id, :menu_id, :user_id)
  end

end
