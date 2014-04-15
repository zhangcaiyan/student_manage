class Xueyuan < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true
  has_many :zhuanyes, dependent: :destroy
end
