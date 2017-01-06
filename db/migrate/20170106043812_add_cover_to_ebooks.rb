class AddCoverToEbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :ebooks, :cover, :text
  end
end
