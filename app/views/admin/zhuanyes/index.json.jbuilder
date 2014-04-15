json.array!(@zhuanyes) do |zhuanye|
  json.extract! zhuanye, :id, :name, :xueyuan_id
  json.url zhuanye_url(zhuanye, format: :json)
end
