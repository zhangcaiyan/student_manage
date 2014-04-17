class ApplicationDate < ActiveRecord::Base
  validates_presence_of :start_at, :end_at
  validate :verify_count, on: :create
  validate :verify_end_at_gte_start_at

  protected

  def verify_count
    errors.add(:base, "只能添加一条记录") if self.class.count > 1
  end

  def verify_end_at_gte_start_at
    errors.add(:end_at, "结束时间必须大于开始时间") if start_at >= end_at
  end
end
