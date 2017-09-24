class SerializableLocation < JSONAPI::Serializable::Resource
  type 'locations'
  attributes :lat, :lng
end
