class Item < ActiveRecord::Base
  # Associations
  belongs_to :list
  
  # Validations
  validates :list, presence: true

  # Callbacks
  before_validation :done_removes_due_date

  def overdue?
    return nil if self.due_date.nil?
    Date.today > self.due_date
  end

  def sortstamp
    if self.due_date.nil?
      self.done ? 0 : 1
    else
      self.overdue? ? self.due_date.to_time.to_i * 2 : self.due_date.to_time.to_i
    end
  end

  protected

    def done_removes_due_date
      self.due_date = nil if self.done = true
    end

end
