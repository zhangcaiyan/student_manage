class Zhuanye < ActiveRecord::Base
  validates :name, uniqueness: {scope: :xueyuan_id}, presence: true
  validates :xueyuan_id, presence: true

  belongs_to :xueyuan
end
