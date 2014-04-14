class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :lockable, :authentication_keys => [:username]

  validates_presence_of :password, :password_confirmation
  validates :email, format: {with: RubyRegex::Email}, uniqueness: true, allow_blank: true
  validates :username, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 6}

  symbolize :category, in: [:student, :admin, :xuegongchu], scopes: :shallow, methods: true

  default_value_for :category, :student

  has_many :scores, dependent: :destroy
  has_many :reward_applications, dependent: :destroy
  has_one :person_info, dependent: :destroy
end
