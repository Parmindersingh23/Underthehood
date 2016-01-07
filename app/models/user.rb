
class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :hashed_password, presence: true
  validate :validate_password
  has_many :posts
  has_many :votes
  has_many :answers, through: :posts

  def validate_password
    if !password.blank?
      errors.add(:password, "can't be blank")
    end
  end

  def password
    @secure_password_obj || BCrypt::Password.new(self.hashed_password)
  end

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    @secure_password_obj = BCrypt::Password.create(plaintext_password)
    self.hashed_password = @secure_password_obj.to_s
  end

  def self.authenticate(user, password)
    @user = User.find_by_username(user)
    puts @user
    if @user && @user.password == password
      return @user
    end
    nil
  end
  # Remember to create a migration!
end
