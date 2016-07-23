class Item < ActiveRecord::Base
  # Associations
  belongs_to :list
  
  # Validations
  validates :list, presence: true

  # Callbacks
  before_validate :done_removes_due_date

  protected

    def done_removes_due_date
      self.due_date = nil if self.done = true
    end

end
