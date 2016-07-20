class User < ActiveRecord::Base
  # Associations
  has_many :lists

  # Validations
  validates :name, presence: true
  has_secure_password

end
