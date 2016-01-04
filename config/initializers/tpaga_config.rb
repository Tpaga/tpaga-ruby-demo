require 'tpaga'

Tpaga::Swagger.configure do |config|
  config.scheme = Rails.application.config.tpaga_schema
  config.host = Rails.application.config.tpaga_host
  config.base_path = Rails.application.config.tpaga_base_path
  config.inject_format = false
  config.api_key = Rails.application.config.tpaga_api_key
end