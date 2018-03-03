class AddVideoToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :video, :string
  end
end
