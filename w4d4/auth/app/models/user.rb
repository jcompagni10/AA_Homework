class User < ApplicationRecord
  attr_reader :password
  validates :username, uniqueness: true
  validates :username, :session_token, presence: true
  validates :password_digest, presence: {message: "can't be blank"},
            allow_nil: true
  validate :password_length

  before_validation {ensure_session_token}
  before_create{digest_password}


  def User.find_by_credentials(username, password)
    user= User.find_by(username: username)
    if user.valid_pass?(password)
      user
    else
      nil
    end
  end

  def password_length
    errors[:password_digest] << "password too short" if password.length < 6
  end

  def digest_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def self.generate_sesssion_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token
    session_token = nil
  end

  def ensure_session_token
    if self.session_token.nil?
      self.session_token = User.generate_sesssion_token
    end
  end

  def valid_pass?(test_pass)
    db_pwd = BCrypt::Password.new(self.password_digest)
    db_pwd.is_password?(test_pass)
  end

  def password=(password)
    puts "password set"
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end


end
