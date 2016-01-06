class Post < ActiveRecord::Base
  has_many :votes, :as => :voteable
  belongs_to :user
  def points
    votes.sum(:value)
  end

  def comment_count

  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
