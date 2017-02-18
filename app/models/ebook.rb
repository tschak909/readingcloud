class Ebook < ApplicationRecord
  attr_accessor :book_local_path   ## Added extra special field for local filesystem import.
  has_attached_file :book
  validates_attachment :book,
                       :presence => true,
                       :content_type => { :content_type => /\A.*\Z/ },
                       :size => { :less_than => 128.megabytes }

  ## Everything below here is special code to deal with importing from the local filesystem ##
  
  before_validation :import_local_book, :if => :book_local_path_provided?

  validates_presence_of :book_local_path_, :if => :book_local_path_provided?, :message => 'is not accessible'

  private

  def book_local_path_provided?
    !self.book_local_path.blank?
  end

  def import_local_book
    self.book = do_import_local_book
    self.book_local_path_ = book_local_path
  end

  def do_import_local_book
    io = open(book_local_path)

    def io.original_filename; path.split('/').last; end

    io.original_filename.blank? ? nil : io

  rescue # Catch URL errors with validations, instead of exceptions.
    
  end
  
end
