class User < ApplicationRecord
  before_save { self.email = email.downcase } # This will make sure that the email in lowercase before saving to the database
  has_many :articles, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: { minimum: 3, maximum: 25}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 105}, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end