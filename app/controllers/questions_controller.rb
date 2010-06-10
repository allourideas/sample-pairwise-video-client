class QuestionsController < ApplicationController

  def index
    @questions = Question.find(:all)
  end

  def destroy
    @question = Question.find(params[:id]) rescue nil #quit throwing errors when i make a typo
    @question.destroy if @question
    redirect_to :action=>'index'
  end

  def create
    @question = Question.new(params[:question])
    @question.attributes['it_should_autoactivate_ideas'] = true
    @question.save
    redirect_to :action=>'index'
  end

end
