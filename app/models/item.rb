class Item < ActiveRecord::Base
  # Associations
  belongs_to :list
  
  # Validations
  validates :list, presence: true

end
