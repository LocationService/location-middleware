json_mime_types = %W(
  application/vnd.api+json
  application/json
)
Mime::Type.register 'application/vnd.api+json', :json, json_mime_types