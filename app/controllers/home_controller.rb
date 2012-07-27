class HomeController < ApplicationController
  def index
    @today = Date.current
    @now   = Time.current
  end
end
