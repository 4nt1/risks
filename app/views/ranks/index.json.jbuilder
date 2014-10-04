json.array!(@ranks) do |rank|
  json.extract! rank, :id, :code, :description, :libelle
  json.url rank_url(rank, format: :json)
end
