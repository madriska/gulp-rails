module Gulp
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path '../../templates', __FILE__

      desc 'Install default gulp files and layout plus prep asset manifests'

      def copy_gulp_directory
        FileUtils.cp_r(File.join(self.class.source_root, 'gulp'), destination_root)
      end

      def create_gulpfile
        copy_file "Gulpfile.js", "Gulpfile.js"
      end

      def create_package_json
        copy_file "package.json", "package.json"
      end

      def create_server_rendering
        copy_file "server_rendering.js", "app/assets/javascripts/server_rendering.js"
      end

      def inject_server_rendering
        application %{config.assets.precompile += ["server_rendering.js"]}
        application do
          %{config.react.server_renderer_options = {
            files: ["server_rendering.js"]
          }}
        end
      end

      def disable_asset_digest_in_development
        application(nil, env: 'development') do
          "config.assets.digest = false"
        end
      end

      def inject_gulp_js
        require_gulp = "//= require gulp\n"

        if js_manifest.exist?
          manifest_contents = File.read(js_manifest)

          if match = manifest_contents.match(/\/\/=\s+require\s+turbolinks\s+\n/)
            inject_into_file js_manifest, require_gulp, { after: match[0] }
          elsif match = manifest_contents.match(/\/\/=\s+require_tree[^\n]*/)
            inject_into_file js_manifest, require_gulp, { before: match[0] }
          else
            append_file js_manifest, require_gulp
          end
        else
          create_file js_manifest, require_gulp
        end
      end

      def inject_gulp_css
        require_gulp = "/*= require gulp */\n"

        if css_manifest.exist?
          manifest_contents = File.read(css_manifest)

          if match = manifest_contents.match(/\/\/=\s+require_self\s+\n/)
            inject_into_file css_manifest, require_gulp, { after: match[0] }
          elsif match = manifest_contents.match(/\/\/=\s+require_tree[^\n]*/)
            inject_into_file css_manifest, require_gulp, { before: match[0] }
          else
            append_file css_manifest, require_gulp
          end
        else
          create_file css_manifest, require_gulp
        end
      end

      def ignore_assets_and_npm_files
        append_file ".gitignore", "node_modules"
        append_file ".gitignore", "public/assets"
      end

      def npm_install
        `npm install`
      end

      private

      def js_manifest
        Pathname.new(destination_root).join('app/assets/javascripts', 'application.js')
      end

      def css_manifest
        Pathname.new(destination_root).join('app/assets/stylesheets', 'application.css')
      end
    end
  end
end
