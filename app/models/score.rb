class Score < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, ->(o) { where category: :student }
  belongs_to_active_hash :category, class_name: "Dict::ScoreCategory"
  belongs_to_active_hash :xueqi, class_name: "Dict::Xueqi"
  belongs_to_active_hash :subject, class_name: "Dict::Subject"
  belongs_to_active_hash :score, class_name: "Dict::Score"

  before_validation :setup_xueqi_id

  validates_presence_of :user_id, :subject_id, :score_id, :xuenian_id, :xueqi_id
  validate :verify_xueqi_id

  default_value_for :xuenian_id, 4


  protected

  def verify_xueqi_id
    errors.add(:xueqi_id, "学期不能为空") if category_id == 2 && xueqi_id.blank?
  end

  def setup_xueqi_id
    self.xueqi_id = nil if category_id == 1
  end


end
