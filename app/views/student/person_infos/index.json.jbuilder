json.array!(@person_infos) do |person_info|
  json.extract! person_info, :id, :name, :gender_id, :xuehao, :zhuanye, :zhiwu, :minzu, :political_id, :score_id, :user_id, :state
  json.url person_info_url(person_info, format: :json)
end
