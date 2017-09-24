class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.references :user, foreign_key: true, null: false
      t.string :did, null: false
      t.string :user_agent, null: false

      t.timestamps
    end
  end
end
