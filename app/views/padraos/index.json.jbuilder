json.array!(@padraos) do |padrao|
  json.extract! padrao, :id, :campo, :valores
  json.url padrao_url(padrao, format: :json)
end
