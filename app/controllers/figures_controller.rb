class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    #binding.pry ~ it's making it here
    erb :'figures/edit'
  end

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])


    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    redirect "/figures/#{@figure.id}"
  end



end
