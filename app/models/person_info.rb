class PersonInfo < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :gender, class_name: "Dict::Gender"
  belongs_to :score, class_name: "Dict::Score"
  belongs_to :political, class_name: "Dict::Political"

  validates_presence_of :name, :gender_id, :xuehao, :zhuanye, :minzu, :political_id, :score_id, :user_id
  validates :name, uniqueness: true
  validates :user_id, uniqueness: true
end
