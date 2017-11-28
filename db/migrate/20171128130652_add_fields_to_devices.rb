class AddFieldsToDevices < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :manufacturer, :string
    add_column :devices, :model, :string
    add_column :devices, :android_release, :string
  end
end
