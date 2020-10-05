class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.timestamps
    end
  end
end
