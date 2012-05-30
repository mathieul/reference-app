class RottenTomatoesMovie
  include HTTParty
  base_uri 'api.rottentomatoes.com/api/public/v1.0'
  format :json
  default_params apikey: APP_CONFIG[:rotten_tomatoes_key]

  attr_reader :raw, :id, :title, :year, :rating

  def self.search(name)
    response = get('/movies.json', query: {q: name, page_limit: 50, page: 1})
    return [] if response.fetch('total', 0) == 0
    response['movies'].map { |raw| new(raw) }
  end

  def initialize(raw)
    @raw = raw
    @id, @title, @year, ratings = @raw.values_at('id', 'title', 'year', 'ratings')
    @rating = ratings['critics_score']
  end
end
