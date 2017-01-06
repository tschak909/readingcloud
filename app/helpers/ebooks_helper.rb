module EbooksHelper

  def get_url(url)
    url[/^[^\?]*/]
  end

end
