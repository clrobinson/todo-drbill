class List < ActiveRecord::Base
  # Associations
  has_many :items, dependent: :destroy
  belongs_to :user
  
  # Validations
  validates :name, presence: true
  validates :user, presence: true

  # Callbacks
  before_validation :set_default_name

  def self.default_name
    "List for #{Date.today.strftime('%b %d, %Y')}"
  end

  protected

    def set_default_name
      self.name = List.default_name if self.name.blank?
      return true
    end

end
