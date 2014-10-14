json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :image, :price, :keywords, :category_id, :owner_id
  json.url item_url(item, format: :json)
end
