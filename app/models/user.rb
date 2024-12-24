class User < ApplicationRecord
  before_save { self.email = email.downcase } # This will make sure that the email in lowercase before saving to the database
  has_many :articles, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: { minimum: 3, maximum: 25}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 105}, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password # This will add password and password_confirmation attributes, require a password_digest attribute, require the presence of the password, require that they match, and require a minimum length
end