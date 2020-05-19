class User < ApplicationRecord

  include BCrypt

  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session

  def password=(password)
    self.password_digest = Password.create(password)
    @password = password
  end

  def valid_password?(password)
    Password.new(password_digest).is_password?(password)
  end

  def ensure_session
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def new_session!
    self.session_token = SecureRandom.urlsafe_base64
    save!
    session_token
  end

  # @return [User, nil]
  def self.find_by_credential(email, password)
    # @type[User, nil]
    user = User.find_by(email: email)
    user if user&.valid_password?(password)
  end

end
