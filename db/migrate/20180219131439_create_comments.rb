class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true
      t.string :content

      t.timestamps
      t.index [:user_id, :work_id], unique: true
    end
  end
end
