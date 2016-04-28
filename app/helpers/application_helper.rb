module ApplicationHelper
  def stylesheet_link_tag(url, options={})
    url = GulpRails::AssetManifest.stylesheet_path(url)

    super(url, options)
  end

  def crossorigin_javascript_include_tag(url, options={})
    url = GulpRails::AssetManifest.javascript_path(url)

    super(url, options)
  end

  def image_tag(url, options={})
    url = GulpRails::AssetManifest.asset_path(url)

    super(url, options)
  end

  def image_path(url, options={})
    url = GulpRails::AssetManifest.asset_path(url)

    super(url, options)
  end

  def image_url(url, options={})
    url = GulpRails::AssetManifest.asset_path(url)

    super((ActionController::Base.asset_host || "") + url, options)
  end
end
