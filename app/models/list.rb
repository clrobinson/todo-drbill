class List < ActiveRecord::Base
  # Associations
  has_many :items, dependent: :destroy
  belongs_to :user
  
  # Validations
  validates :user, presence: true

end
