
class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  # has_many :posts

  def password
    @password || BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(user, password)
    @user = User.find_by_email(user) || User.find_by_username(user)
    puts @user
    if @user && @user.password == password
      return @user
    end
    nil
  end
  # Remember to create a migration!
end
