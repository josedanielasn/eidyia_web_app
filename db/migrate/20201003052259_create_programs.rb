class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.integer :course_id
      t.integer :batch_id
      t.timestamps
    end
  end
end
