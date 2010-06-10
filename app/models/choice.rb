class Choice < ActiveResource::Base

  self.site = "#API_HOST/questions/:question_id/"
  self.user = PAIRWISE_USERNAME
  self.password = PAIRWISE_PASSWORD

  def question_id
    prefix_options[:question_id]
  end

  attr_accessor :name, :question_text, :question_ideas
end
