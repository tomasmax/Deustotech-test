json.array!(@datasets) do |dataset|
  json.extract! dataset, :id, :name, :object_name, :license_title, :license_url
  json.url dataset_url(dataset, format: :json)
end
