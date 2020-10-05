class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :session_name
      t.integer :batch_id
      t.timestamps
    end
  end
end
