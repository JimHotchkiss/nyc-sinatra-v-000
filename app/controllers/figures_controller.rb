class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])

    @figure.titles << Title.first
    @figure.landmarks << Landmark.first
# need to figure a way to check if titles or landmarks exist, if not create them

    #if !params[:title][:name].empty?
    #  @figure.titles << Title.create(params[:title])
    #  binding.pry
    #end

    #if !params[:landmark][:name].empty?
    #  @figure.landmarks << Landmark.create(params[:landmark])
    #end

  end



end
