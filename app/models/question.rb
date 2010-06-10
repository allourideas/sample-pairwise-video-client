class Question < ActiveResource::Base
  self.site = API_HOST
  self.user = PAIRWISE_USERNAME
  self.password = PAIRWISE_PASSWORD

  attr_accessor :name, :question_text, :ideas, :url, :information, :email, :password
end
