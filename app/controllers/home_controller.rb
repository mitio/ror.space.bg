class HomeController < ApplicationController
  def index
    @today = Date.current
  end
end
