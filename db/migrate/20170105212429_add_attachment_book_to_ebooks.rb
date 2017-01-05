class AddAttachmentBookToEbooks < ActiveRecord::Migration
  def self.up
    change_table :ebooks do |t|
      t.attachment :book
    end
  end

  def self.down
    remove_attachment :ebooks, :book
  end
end
