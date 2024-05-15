class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps
    end
  end
end
