#encoding: utf-8

# coding: utf-8
class User < ActiveRecord::Base
  has_many :menus

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

  def baby_stage
    if baby_birthday > 6.months.ago.to_date
      '離乳食 初期（5〜6ヶ月）'
    elsif baby_birthday > 8.months.ago.to_date
      '離乳食 中期（7〜8ヶ月）'
    else
      '離乳食 後期（9〜11ヶ月）'
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
