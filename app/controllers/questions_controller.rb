class QuestionsController < ApplicationController

  def index
    @questions = Question.find(:all)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy if @question
    redirect_to :action=>'index'
  end

  def create
    flash[:parse_failures] = []

    # parse block of ideas, only store the vid identifier
    yt_regexp = /(?:http:\/\/)?(?:www\.)?youtube.com\/watch\?v=([^&]*)(?:&[^&])*/
    params[:question][:ideas] = params[:question][:ideas].lines.to_a.map{ |url|
      res = url.match(yt_regexp)
      if (res)
        res[1]
      else
        flash[:parse_failures].push(url)
        nil
      end
    }.join

    @question = Question.new(params[:question])
    @question.attributes['it_should_autoactivate_ideas'] = true
    @question.save
    redirect_to :action=>'index'
  end
end
