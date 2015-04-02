json.array!(@blabs) do |blab|
  json.extract! blab, :id, :title, :body, :url
  json.url blab_url(blab, format: :json)
end
