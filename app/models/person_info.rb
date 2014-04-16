class PersonInfo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :gender_id, :xuehao, :zhuanye_id, :minzu, :political_id, :score_id, :user_id
  validates :name, uniqueness: true
  validates :user_id, uniqueness: true
end
