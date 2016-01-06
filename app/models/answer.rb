class Answer < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes, :as => :voteable
end
