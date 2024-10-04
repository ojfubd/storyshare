# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"



# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# フォントファイルのパスを追加
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join("node_modules")
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap-icons/font")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
#Rails.application.config.assets.precompile += %w( admin.js )
Rails.application.config.assets.precompile += %w( admin/application.css admin.js)
# プリコンパイルするファイルの拡張子を追加
Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf .gif )