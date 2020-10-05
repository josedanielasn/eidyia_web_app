class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :message_body
      t.integer :user_id
      t.integer :video_id
      t.timestamps
    end
  end
end
