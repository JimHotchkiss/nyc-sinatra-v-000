class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    # a figure can have many landmarks, this will be an array
    # a figure can have many titles, this will be an array
    @figure = Figure.create(name: params[:figure][:name])
    @figure.titles << Title.first
# this works

  end



end
