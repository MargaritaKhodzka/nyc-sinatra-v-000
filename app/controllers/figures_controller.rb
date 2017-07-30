require 'pry'

class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:new_title].empty?
      @figure.titles << Title.create(name: params[:new_title])
    end
    if !params[:new_landmark].empty?
      @figure.landmarks << Landmark.create(name: params[:new_landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch "/figures/:id" do
    #binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles.create(params[:title])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
