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

    unless valid_json?(res.body)
      return { items: [], status: 422 }
    end

    { items: res.body, status: res.code.to_i }
  end

  def valid_json?(string)
    JSON.parse(string)
    true
  rescue Exception => e
    return false
  end
end