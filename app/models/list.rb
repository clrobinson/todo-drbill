class List < ActiveRecord::Base
  # Associations
  has_many :items, dependent: :destroy
  belongs_to :user
  
  # Validations
  validates :user, presence: true

  # Callbacks
  before_create :set_default_name

  def self.default_name
    "Tasks for #{Date.today.strftime('%d/%m/%Y')}"
  end

  protected

    def set_default_name
      self.name = List.default_name if self.name.blank?
    end

end
