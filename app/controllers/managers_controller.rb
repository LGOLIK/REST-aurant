class ManagersController < ApplicationController
  before_action :authenticate

  def index
    @managers = "Managers page"
  end
end
