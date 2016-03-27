class ServersController < ApplicationController
  before_action :authenticate

  def index
    @servers = "Servers page"
  end
end
