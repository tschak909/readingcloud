class EbooksController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @ebooks = Ebook.order(:title).page(params[:page])
  end

  def new
    @ebook = Ebook.new
    @ebook.cover = "foo"
    @ebook.title = "foo"
    @ebook.titles = "foo"
    @ebook.languages = "foo"
    @ebook.contributors = "foo"
    @ebook.coverages = "foo"
    @ebook.creators = "foo"
    @ebook.dates = "foo"
    @ebook.descriptions = "foo"
    @ebook.formats = "foo"
    @ebook.publishers = "foo"
    @ebook.relations = "foo"
    @ebook.rights = "foo"
    @ebook.sources = "foo"
    @ebook.subjects = "foo"
    @ebook.types = "foo"
    @ebook.uniqueid = "foo"
    @ebook.epubver = "foo"
  end

  def create
    @ebook = Ebook.create(ebook_params)
    p = EPUB::Parser.parse(@ebook.book.path)
    @ebook.cover = "data:"+p.cover_image.media_type+"; base64," + Base64.encode64(p.cover_image.read) unless p.cover_image.nil?
    @ebook.title = p.title
    @ebook.titles = p.metadata.to_h[:titles][0].to_s unless p.metadata.to_h[:titles].nil?
    @ebook.languages = p.metadata.to_h[:languages][0].to_s unless p.metadata.to_h[:languages].nil?
    @ebook.contributors = p.metadata.to_h[:contributors][0].to_s unless p.metadata.to_h[:contributors].nil?
    @ebook.coverages = p.metadata.to_h[:coverages][0].to_s unless p.metadata.to_h[:coverages].nil?
    @ebook.creators = p.metadata.to_h[:creators][0].to_s unless p.metadata.to_h[:creators].nil?
    @ebook.dates = p.metadata.to_h[:dates][0].to_s unless p.metadata.to_h[:dates].nil?
    @ebook.descriptions = p.metadata.to_h[:descriptions][0].to_s unless p.metadata.to_h[:descriptions].nil?
    @ebook.formats = p.metadata.to_h[:formats][0].to_s unless p.metadata.to_h[:formats].nil?
    @ebook.publishers = p.metadata.to_h[:publishers][0].to_s unless p.metadata.to_h[:publishers].nil?
    @ebook.relations = p.metadata.to_h[:relations][0].to_s unless p.metadata.to_h[:relations].nil?
    @ebook.rights = p.metadata.to_h[:rights][0].to_s unless p.metadata.to_h[:rights].nil?
    @ebook.sources = p.metadata.to_h[:sources][0].to_s unless p.metadata.to_h[:sources].nil?
    @ebook.subjects = p.metadata.to_h[:subjects][0].to_s unless p.metadata.to_h[:subjects].nil?
    @ebook.types = p.metadata.to_h[:types][0].to_s unless p.metadata.to_h[:types].nil?
    @ebook.uniqueid = p.metadata.to_h[:uniqueid][0].to_s unless p.metadata.to_h[:uniqueid].nil?
    @ebook.epubver = p.metadata.to_h[:epubver][0].to_s unless p.metadata.to_h[:epubver].nil?

    if @ebook.save
      render json: { message: "success" }, :status => 200
    else
      render json: { error: @ebook.errors.full_messages.join(',')}, :status => 400
    end
  end

  def show
    @ebook = Ebook.find(params[:id])
    render :layout => "reader"
  end

  def destroy
    @ebook = Ebook.find(params[:id])
    @ebook.book.destroy
    @ebook.destroy
    redirect_to ebooks_url
  end

  def choose
  end
  
  def import
    @ebooks = []
    @path = params["path"]
    epubfiles = File.join(params["path"],"**","*.epub")
    Dir.glob(epubfiles).each do |file|
      ebook = Ebook.new(:book_local_path => file)
      p = EPUB::Parser.parse(file)
      ebook.cover = "data:"+p.cover_image.media_type+"; base64," + Base64.encode64(p.cover_image.read) unless p.cover_image.nil?
      ebook.title = p.title
      ebook.titles = p.metadata.to_h[:titles][0].to_s unless p.metadata.to_h[:titles].nil?
      ebook.languages = p.metadata.to_h[:languages][0].to_s unless p.metadata.to_h[:languages].nil?
      ebook.contributors = p.metadata.to_h[:contributors][0].to_s unless p.metadata.to_h[:contributors].nil?
      ebook.coverages = p.metadata.to_h[:coverages][0].to_s unless p.metadata.to_h[:coverages].nil?
      ebook.creators = p.metadata.to_h[:creators][0].to_s unless p.metadata.to_h[:creators].nil?
      ebook.dates = p.metadata.to_h[:dates][0].to_s unless p.metadata.to_h[:dates].nil?
      ebook.descriptions = p.metadata.to_h[:descriptions][0].to_s unless p.metadata.to_h[:descriptions].nil?
      ebook.formats = p.metadata.to_h[:formats][0].to_s unless p.metadata.to_h[:formats].nil?
      ebook.publishers = p.metadata.to_h[:publishers][0].to_s unless p.metadata.to_h[:publishers].nil?
      ebook.relations = p.metadata.to_h[:relations][0].to_s unless p.metadata.to_h[:relations].nil?
      ebook.rights = p.metadata.to_h[:rights][0].to_s unless p.metadata.to_h[:rights].nil?
      ebook.sources = p.metadata.to_h[:sources][0].to_s unless p.metadata.to_h[:sources].nil?
      ebook.subjects = p.metadata.to_h[:subjects][0].to_s unless p.metadata.to_h[:subjects].nil?
      ebook.types = p.metadata.to_h[:types][0].to_s unless p.metadata.to_h[:types].nil?
      ebook.uniqueid = p.metadata.to_h[:uniqueid][0].to_s unless p.metadata.to_h[:uniqueid].nil?
      ebook.epubver = p.metadata.to_h[:epubver][0].to_s unless p.metadata.to_h[:epubver].nil?

      if ebook.save
        @ebooks << ebook
      end

    end
    
  end
  
  private
  
  def ebook_params
    params.require(:ebook).permit(:title,:titles,:languages,:contributors,:coverages,:creators,:dates,:descriptions,:formats,:publishers,:relations,:rights,:sources,:subjects,:types,:uniqueid,:epubver,:book)
  end
  
end
