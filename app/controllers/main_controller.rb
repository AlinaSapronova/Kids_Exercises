class MainController < ApplicationController
  def welcome
     authorize :main, :welcome?
  end
end
