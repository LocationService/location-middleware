class SerializableLocation < JSONAPI::Serializable::Resource
  type 'locations'
  attributes :lat, :lng, :created_at
end
