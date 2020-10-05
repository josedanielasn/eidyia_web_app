class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :video_title
      t.text :video_description
      t.integer :session_id
      t.timestamps
    end
  end
end
