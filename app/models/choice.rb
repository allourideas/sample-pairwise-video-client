class Choice < ActiveResource::Base

  self.site = "#{API_HOST}/questions/:question_id/"
  self.user = PAIRWISE_USERNAME
  self.password = PAIRWISE_PASSWORD

  # do i need this ?
  def question_id
    prefix_options[:question_id]
  end

  def data
    attributes['data']
  end

end
