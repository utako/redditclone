class ChangeColumnToLinks < ActiveRecord::Migration
  def change
    change_column :links, :submitter_id, :integer, null: false
  end
end
