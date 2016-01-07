class Post < ActiveRecord::Base
  has_many :votes, :as => :voteable
  has_many :answers
  belongs_to :user
  def points
    votes.sum(:value)
  end

  def comment_count

  end

  def user
    # User.find(Post.last.user_id).username
    # Post.username
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
