class Score < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, ->(o) { where category: :student }
  belongs_to_active_hash :category, class_name: "Dict::ScoreCategory"
  belongs_to_active_hash :xueqi, class_name: "Dict::Xueqi"
  belongs_to_active_hash :xuenian, class_name: "Dict::Xuenian"
  belongs_to_active_hash :subject, class_name: "Dict::Subject"
  belongs_to_active_hash :score, class_name: "Dict::Score"

  validates_presence_of :user_id, :subject_id, :score_id, :xuenian_id, :xueqi_id, :caoxing, :pingjun_score
  validates :caoxing, numericality: true
  validates :pingjun_score, numericality: true

  default_value_for :xuenian_id, 4



end
