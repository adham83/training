json.array!(@posts) do |post|
  json.extract! post, :id, :title, :blurp, :body
  json.url post_url(post, format: :json)
end
