class Post < ActiveRecord::Base
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  has_many :answers
  belongs_to :user

  def points
    votes.sum(:value)
  end

  def comment_count

  end

  def author
    self.user.username
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
