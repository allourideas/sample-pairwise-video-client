class MainController < ApplicationController
  def hello
    @time = Time.now()
  end
end
