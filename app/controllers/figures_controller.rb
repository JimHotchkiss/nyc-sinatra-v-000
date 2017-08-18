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
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark_id])

    if !params[:figure][:title_ids].empty?
      @figure.titles << Title.find_or_create_by(params[:figure][:title_id])
    end

    binding.pry
    @figure.save

    redirect "/figures/#{@figure.id}"
  end



end
