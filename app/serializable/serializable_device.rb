class SerializableDevice < JSONAPI::Serializable::Resource
  type 'devices'
  attributes :did, :user_agent
end
