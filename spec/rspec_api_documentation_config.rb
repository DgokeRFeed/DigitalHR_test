RspecApiDocumentation.configure do |config|
  config.app = Rails.application
  config.docs_dir = Rails.root.join('doc/api')

  # An array of output format(s).
  # Possible values are :json, :html, :combined_text, :combined_json,
  #   :json_iodocs, :textile, :markdown, :append_json, :slate,
  #   :api_blueprint, :open_api
  config.format = :json

  config.request_headers_to_include = %w[Content-Type]
  config.response_headers_to_include = %w[Content-Type]

  config.keep_source_order = true

  # needed for "parameter :status" to work:
  # https://github.com/zipmark/rspec_api_documentation/issues/329
  config.disable_dsl_status!
end