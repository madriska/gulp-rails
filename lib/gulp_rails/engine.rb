module GulpRails
  class Engine < ::Rails::Engine
    config.after_initialize do
      require_relative './asset_manifest'
    end

    initializer "gulp_rails.assets.precompile", group: :all do |app|
      app.config.assets.paths <<
        app.root.join("public", "assets", "stylesheets").to_s
      app.config.assets.paths <<
        app.root.join("public", "assets", "javascripts").to_s
    end
  end
end
