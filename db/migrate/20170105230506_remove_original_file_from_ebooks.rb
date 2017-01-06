class RemoveOriginalFileFromEbooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :ebooks, :originalfile, :string
  end
end
