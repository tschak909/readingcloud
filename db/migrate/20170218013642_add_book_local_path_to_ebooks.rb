class AddBookLocalPathToEbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :ebooks, :book_local_path_, :string
  end
end
