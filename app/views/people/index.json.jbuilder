json.array!(@people) do |person|
  json.extract! person, :id, :name, :birth
  json.url person_url(person, format: :json)
end
