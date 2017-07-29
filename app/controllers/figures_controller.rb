class FiguresController < ApplicationController

  get '/' do
    redirect to "/figures"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:new_landmark].empty?
      @figure.landmarks << Landmark.create(name: params[:new_landmark])
    end
    if !params[:new_title].empty?
      @figure.titles << Title.create(name: params[:new_title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

end
