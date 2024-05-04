class QueriesController < ApplicationController

  
  #def create
  #  respond_to do |format|
  #    @query = Query.new(query_params)
  #    if @query.save 
  #       format.html{ redirect_to root_url,
  #        notice: 'Agregado'
  #       }
  #      else 
  #        format.html{
  #        redirect_to root_url,
  #        alert: 'Error'
  #       }
  #  end
  #end
  #  run_query
  #end

  def create
    @query = Query.new
    @query.query =  params[:query][:query]
    @query.amount = params[:query][:amount]
    @query.Fparams = params[:query][:Fparams]

    @var_text = @query.query
    @var_params = @query.Fparams
    #@var_text = @var_text.delete('\\"')
    #@var_text = @var_text.gsub("\\", "")
    #@var_text = @var_text.gsub(@var_text,@var_text)
    #@var_text = @var_text.delete('\#"')
    #@var_text = @var_text.gsub('{','#{')
    
    run_query
  end


  def run_query
      @client = Mysql2::Client.new(:host => "", :username => "", :password=> "")
      
      puts @query.query
      puts @var_params
    for a in 1..@query.amount.to_i do

         @statement = @client.prepare(@var_text)
         @statement.execute(@var_params)

    end
  end

  private 

  def query_params
    if params[:query].is_a? String
      params[:query]
    else
      params.require(:query).permit(:query,:amount,:Fparams)
    end
  end 
end