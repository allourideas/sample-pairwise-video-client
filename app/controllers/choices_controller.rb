class ChoicesController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @choices = Choice.find(:all)#:params => {:question_id => @question.id})
  end

  def show
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:id])
  end

end
