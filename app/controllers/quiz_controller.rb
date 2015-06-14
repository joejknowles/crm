class QuizController < ApplicationController
  before_filter :find_client

  def strategy
    @section = Section.where(name: 'strategy').first
  end

  def update_strategy
    p params
    @client.quizs.create()
    redirect_to '/quiz/sections/processes'
  end

  def processes
    @section = Section.where(name: 'processes').first
  end

  def update_processes
    p params
    @client.quizs.create()
    redirect_to '/quiz/sections/technology'
  end

  def technology
    @section = Section.where(name: 'technology').first
  end

  def update_technology
    p params
    @client.quizs.create()
    redirect_to '/quiz/sections/people'
  end

  def people
    @section = Section.where(name: 'people').first
  end

  def update_people
    p params
    @client.quizs.create()
    redirect_to '/quiz/sections/results'
  end

  def find_client
    @client = Client.find(session[:client_id])
  end
end
