json.array!(@reward_applications) do |reward_application|
  json.extract! reward_application, :id, :application_id, :phone, :xueyuan_id, :content, :rongyu, :user_id
  json.url reward_application_url(reward_application, format: :json)
end
