class PlacesService
  BASE_URL = 'https://xegr-geography.herokuapp.com/places/autocomplete'

  def initialize
  end

  def search(input)
    query(input)
  end

  private
  def query(input)
    uri = URI(BASE_URL)
    params = { input: input }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    { items: res.body, status: res.code }
  end
end