class AddIndexToComment < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.remove_index column: [:user_id, :work_id], unique: true
      t.index [:user_id, :work_id]
    end
  end
end
