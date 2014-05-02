class ChangeALotOfStuff < ActiveRecord::Migration
  def change
    create_table :linksubs do |t|
      t.integer :sub_id, null: false
      t.integer :link_id, null: false

      t.timestamps
    end

    remove_column :links, :sub_id
  end
end
