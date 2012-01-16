module LinkStoreTest

  @@links = {"123" => "http://www.espn.com"}

  def link(key)
    @@links[key]
  end

  def shorten(key, link)
    @@links[key] = link
  end
end