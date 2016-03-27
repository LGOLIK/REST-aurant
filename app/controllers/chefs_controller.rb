class ChefsController < ApplicationController
  before_action :authenticate

  def index
    @chefs = "Chefs page"
  end

end
