json.array!(@users) do |user|
  json.extract! user, :id, :name, :string, :email, :string
  json.url user_url(user, format: :json)
end
