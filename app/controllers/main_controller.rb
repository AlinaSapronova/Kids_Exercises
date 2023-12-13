class MainController < ApplicationController
  before_action :authenticate_user!
  def welcome
     authorize :main, :welcome?
  end
end
