json.array!(@item_requests) do |item_request|
  json.extract! item_request, :id, :item_id_id, :user_id_id, :fromDate, :toDate, :description, :price
  json.url item_request_url(item_request, format: :json)
end
