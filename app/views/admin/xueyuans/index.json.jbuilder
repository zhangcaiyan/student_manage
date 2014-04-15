json.array!(@xueyuans) do |xueyuan|
  json.extract! xueyuan, :id, :name
  json.url xueyuan_url(xueyuan, format: :json)
end
