class AddProgramIdColumnInSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :program_id, :integer
  end
end
