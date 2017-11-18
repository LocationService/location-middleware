class SerializableDevice < JSONAPI::Serializable::Resource
  type 'devices'
  attributes :device_id

  has_many :locations do
    link :related do
      @url_helpers.api_v1_device_locations_path(@object.id)
    end

    meta do
      { count: @object.locations.count }
    end
  end
end
