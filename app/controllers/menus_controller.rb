class MenusController < ApplicationController
  before_action :authenticate

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      redirect_to request.referer
    end
  end

  # edit to bring up the edit menu form
  def edit
    @menu = Menu.find(params[:id])
  end

  # update to actually perform the update action
  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menus_path
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end


  private

  def menu_params
    # binding.pry
    params.require(:menu).permit(:name, :cuisine, :price)
  end

end
