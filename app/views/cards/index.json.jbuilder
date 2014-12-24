json.array!(@cards) do |card|
  json.extract! card, :id, :birth, :soulcard, :sunsign, :moonsign, :minorsoulcard, :zodiaccard, :person_id
  json.url card_url(card, format: :json)
end
