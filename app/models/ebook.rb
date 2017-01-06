class Ebook < ApplicationRecord
  has_attached_file :book
  validates_attachment :book,
                       :presence => true,
                       :content_type => { :content_type => /\A.*\Z/ },
                       :size => { :less_than => 128.megabytes }
end
