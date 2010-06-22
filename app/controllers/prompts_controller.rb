class PromptsController < ApplicationController
  def index
    @question = Question.find(params[:question_id], :params => {
                                :with_prompt => true,
                                :with_appearance => true,
                                :visitor_identifier => "guest"
                              })
    @question_id = params[:question_id]
    @appearance_lookup = @question.attributes['appearance_id']
    @prompt_id = @question.attributes['picked_prompt_id']
    @prompt = Prompt.find(@prompt_id, :params => {:question_id => params[:question_id]})
  end

  def vote
    prompt = Prompt.find(params[:id], :params => {:question_id => params[:question_id]})
    question_id = params[:question_id]
    vote = prompt.post(:vote,
                       :question_id => params[:question_id],
                       :vote => {
                         :direction => params[:direction],
                         :visitor_identifier => "guest",
                         :appearance_lookup => params[:appearance_lookup]
                       },
                       :next_prompt => {
                         :with_appearance => true,
                         :with_visitor_stats => true,
                         :visitor_identifier => request.session_options[:id]
                       })
    logger.debug "Question id: #{question_id}"
    redirect_to(question_prompts_path(question_id))
    #next_prompt = Crack::XML.parse(vote.body)['prompt']
  end
end

