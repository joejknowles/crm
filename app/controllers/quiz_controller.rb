class QuizController < ApplicationController
  before_filter :find_client

  def strategy
    @section = Section.where(name: 'strategy').first
  end

  def update_strategy
    p params
    @client.quizs.create(

    )
    redirect_to '/quiz/sections/processes'
  end

  def find_client
    @client = Client.find(session[:client_id])
  end

  def processes
  end
end
