class Score < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, ->(o) { where category: :student }
  belongs_to_active_hash :category, class_name: "Dict::ScoreCategory"
  belongs_to_active_hash :xueqi, class_name: "Dict::Xueqi"
  belongs_to_active_hash :subject, class_name: "Dict::Subject"
  belongs_to_active_hash :score, class_name: "Dict::Score"

  before_validation :setup_xueqi_id

  validates_presence_of :user_id, :category_id, :subject_id, :score_id
  validate :verify_xueqi_id

  def xueqi?
    category_id == 2
  end

  def niandu?
    category_id == 1
  end

  protected

  def verify_xueqi_id
    errors.add(:xueqi_id, "学期不能为空") if category_id == 2 && xueqi_id.blank?
  end

  def setup_xueqi_id
    self.xueqi_id = nil if category_id == 1
  end


end
