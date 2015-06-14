class QuizController < ApplicationController
  before_filter :find_client

  def strategy
    @section = Section.where(name: 'strategy').first
  end

  def update_strategy
    @quiz = @client.quizs.create()
    add_answers
    redirect_to '/quiz/sections/processes'
  end

  def processes
    @section = Section.where(name: 'processes').first
  end

  def update_processes
    @quiz = @client.quizs.first
    add_answers
    redirect_to '/quiz/sections/technology'
  end

  def technology
    @section = Section.where(name: 'technology').first
  end

  def update_technology
    @quiz = @client.quizs.first
    add_answers
    redirect_to '/quiz/sections/people'
  end

  def people
    @section = Section.where(name: 'people').first
  end

  def update_people
    @quiz = @client.quizs.first
    add_answers
    redirect_to '/quiz/sections/results'
  end

  def find_client
    @client = Client.find(session[:client_id])
  end

  def add_answers
    params.each do |key, value|
      matches = []
      key.scan(/_/) { |c| matches << $~.offset(0)[0] }
      end_of_q_key = matches[1]
      next unless end_of_q_key
      q_key = key[0...end_of_q_key]
      answer_type = key[-2] == 'n' ? :current_maturity : :target_maturity
      question = Question.where(question_key: q_key).first
      answer = @quiz.answers.find_or_create_by(question: question)
      answer.update(answer_type => value.to_i)
    end
  end
end
