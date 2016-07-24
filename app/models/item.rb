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
      self.done ? 200000001 : 200000000
    else
      due_int = self.due_date.to_time.to_i
      self.overdue? ? (due_int * 0.01).floor : (due_int * 0.02).floor
    end
  end

  protected

    def done_removes_due_date
      self.due_date = nil if self.done
      return true
    end

end
