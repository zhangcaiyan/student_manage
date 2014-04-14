json.array!(@student_scores) do |student_score|
  json.extract! student_score, :id, :category_id, :xueqi_id, :subject, :score_id, :user_id
  json.url student_score_url(student_score, format: :json)
end
