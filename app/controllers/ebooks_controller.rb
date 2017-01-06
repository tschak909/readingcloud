class EbooksController < ApplicationController

  def index
  end

  def new
    @ebook = Ebook.new
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
    if @ebook.save
      render json: { message: "success" }, :status => 200
    else
      render json: { error: @ebook.errors.full_messages.join(',')}, :status => 400
    end
  end

  private
  
  def ebook_params
    params.require(:ebook).permit(:title,:titles,:languages,:contributors,:coverages,:creators,:dates,:descriptions,:formats,:publishers,:relations,:rights,:sources,:subjects,:types,:uniqueid,:epubver,:book)
  end
  
end
