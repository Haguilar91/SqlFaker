class HomeController < ApplicationController
  require 'faker'
  def index
    #@home = Home.new
    @queries = Query.new
   
  end



end
