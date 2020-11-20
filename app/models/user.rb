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
end
