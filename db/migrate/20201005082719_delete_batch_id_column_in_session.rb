class DeleteBatchIdColumnInSession < ActiveRecord::Migration[6.0]
  def change
    remove_column :sessions, :batch_id
  end
end
