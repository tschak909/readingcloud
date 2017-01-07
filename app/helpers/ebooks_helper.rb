module EbooksHelper

  def get_url(url)
    url[/^[^\?]*/]
  end

  def ebook_cover(cover)
    if cover.nil?
      image_path("ebook-icon.png")
    else
      cover
    end
  end
  
end
