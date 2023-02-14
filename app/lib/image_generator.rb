class ImageGenerator
  API_URL = "https://api.openai.com/v1/images/generations".freeze

  def self.generate(prompt)
    api_key = Rails.application.credentials.dig(:openapi, :api_key)
    uri = URI(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    params = { prompt: prompt.prompt, n: prompt.number_images || 1, size: prompt.size }
    request.body = (params.to_json)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Bearer #{api_key}"

    response = http.request(request)
    JSON.parse(response.body, symbolize_names: true)
  end
end
