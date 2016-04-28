module GulpRails
  class AssetManifest
    MANIFEST_FILE = Rails.root.join("public/assets/rev-manifest.json")

    def self.manifest
      @manifest ||= begin
        if File.exists?(MANIFEST_FILE)
          JSON.parse(File.read(MANIFEST_FILE))
        end
      end
    end

    def self.stylesheet_path(url)
      manifest_path(url) do |manifest|
        url += ".css" unless url.end_with?(".css")
        manifest[url] || url
      end
    end

    def self.javascript_path(url)
      manifest_path(url) do |manifest|
        url += ".js" unless url.end_with?(".js")
        manifest[url] || url
      end
    end

    def self.asset_path(url)
      manifest_path(url) do |manifest|
        manifest[url] || url
      end
    end

    private

    def self.manifest_path(url)
      if AssetManifest.manifest
        yield AssetManifest.manifest
      else
        url
      end
    end
  end
end
