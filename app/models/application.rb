class Application < ActiveRecord::Base
	has_many :reward_applications, dependent: :destroy
end
