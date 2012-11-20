class User < ActiveRecord::Base
  attr_accessor :password
  validates :name, presence: true, uniqueness: true
  validates :password, presence: {on: :create}, confirmation: true
  validates :baby_birthday, presence: true
  before_save :encrypt_password

  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
