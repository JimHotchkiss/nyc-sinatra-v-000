class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/new'
  end

end