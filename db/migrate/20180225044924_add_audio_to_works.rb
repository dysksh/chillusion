class AddAudioToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :audio, :string
  end
end
