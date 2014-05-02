class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { allow_nil: true, minimum: 6 }
  validates :password, presence: true, on: :create
  before_validation :ensure_session_token
  has_many :subs

  def self.find_user_credentials(creds)
    user = User.find_by_username(creds[:username])
    return user if user.try(:is_password?, creds[:password])
    nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.hex
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

end
