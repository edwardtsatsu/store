class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.integer :current_level
      t.integer :diagonstic_level
      t.datetime :first_message_timestamp
      t.datetime :last_message_timestamp
      t.datetime :deleted_at
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps
    end
  end
end
