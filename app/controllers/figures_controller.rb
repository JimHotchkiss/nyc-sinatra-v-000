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
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if params[:figure][:title_ids]
      @figure.titles << Title.find_or_create_by(params[:figure][:title_ids])
    elsif !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids]
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark_ids])
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

     @figure.save
     redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    binding.pry
    redirect "/figures/#{@figure.id}"
  end



end
