class PromptsController < ApplicationController
  def index
    @question = Question.find(params[:question_id], :params => {:with_prompt => true})
    prompt_id = @question.attributes['picked_prompt_id']
    @prompt = Prompt.find(prompt_id, :params => {:question_id => params[:question_id]})
  end

  def vote
    prompt = Prompt.find(params[:id], :params => {:question_id => params[:question_id]})
    vote = prompt.post("vote_#{params[:direction]}".to_sym,
                       :question_id => params[:question_id],
                       :params => {:auto => request.session_options[:id],
                         :time_viewed => params[:time_viewed],
                         :appearance_lookup => params[:appearance_lookup]
                       })
  end
end

