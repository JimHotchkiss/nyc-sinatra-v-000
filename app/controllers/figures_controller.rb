class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.find_by(params[:id])
    @figure = Figure.create(params[:figure])
    binding.pry
  end

end
