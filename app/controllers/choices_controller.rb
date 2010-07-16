class ChoicesController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @choices = Choice.find(:all, :params => {:question_id => @question.id, :include_inactive => true})
    @fields = @choices.first.attributes.keys rescue []
  end

  def show
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:id])
  end

  def create
    flash[:parse_failures] = []
    yt_regexp = /(?:http:\/\/)?(?:www\.)?youtube.com\/watch\?v=([^&]*)(?:&[^&])*/
    res = params[:choice][:data].match(yt_regexp)

    if (res)
      params[:choice][:data] = res[1]
      @choice = Choice.new(params[:choice])
      @choice.prefix_options = { :question_id => params[:question_id] }
      @choice.attributes[:active] = true
      @choice.save
    else
      flash[:parse_failures].push(params[:choice][:data])
    end
    redirect_to :controller => :prompts, :action => :index
  end

  def toggle
    @choice = Choice.find(params[:id], :params => { :question_id => params['question_id'] })
    @choice.active = !@choice.active
    @choice.prefix_options = { :question_id => params['question_id'] }
    @choice.save

    redirect_to question_choices_path(params['question_id'])
  end

end
