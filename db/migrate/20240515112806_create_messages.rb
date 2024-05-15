class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.string :content
      t.string :recipient # optuonal
      t.references :user, foreign_key: true, type: :uuid
      t.datetime :deleted_at
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps
    end
  end
end
