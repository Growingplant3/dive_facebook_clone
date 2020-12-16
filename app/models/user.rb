class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name,
    presence: true,
    length: { maximum: 20 }
  validates :email,
    presence: true,
    length: { maximum: 50 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 8, maximum: 16 },
    format: { with: /\A[a-z\d]{8,16}+\z/i }

  has_many :pictures
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
