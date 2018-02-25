class AddTimeZoneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :time_zone, :string, default: "Europe/Kiev", null: false
  end
end
