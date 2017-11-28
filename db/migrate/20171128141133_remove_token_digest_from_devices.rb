class RemoveTokenDigestFromDevices < ActiveRecord::Migration[5.1]
  def up
    remove_column :devices, :token_digest
  end
end
