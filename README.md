GulpRails
=========

Making Gulp, Rails, and the asset pipeline love each other.

Heavily inspired (any most of the gulp related files copied) from
[gulp-rails-pipeline](gulp-rails-pipeline).

## Install

Before you get started ensure nodejs and npm are installed and working on
your system.

1. Add the following line to your `Gemfile`.

    ```ruby
    gem 'gulp_rails', git: 'https://github.com/madriska/gulp-rails'
    ```

2. Run `bundle install` to download and install the gem from GitHub.

3. Run `rails g gulp:install` to copy the gulp and configuration files
   into place.

4. Edit `gulp/config.js` so it reflects the appropriate proxy for browsersync.

## Usage

In development, first fire up your rails server just like you normally would,
then run `gulp` in your console. This will watch the `gulp/assets` directory for
changes and fire up browser sync.

Now if you add or update assets in `gulp/assets` they will be recompiled and
loaded into your browser.

## Asset File Structure

### gulp/assets

This is where all your source files will live. Your source icons for icon fonts,
sass files, js modules, and images. Anything that needs to get processed by
Gulp. All assets are set up to compile to `public/assets`.

### public/assets

The destination of your compiled and processed assets. The `application.css` and
`application.js` manifest files in `app/assets` pull compiled code from this
folder.

### app/assets

The old default asset directory should only include manifest files, which are
necessary if you need to require gem installed assets (e.g., jquery_ujs,
turbolinks) with Sprockets. The manifest files pull in gem assets, as well as
our compiled js and css files from `/public/assets`.

## License

Copyright 2016 Jordan Byron

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[gulp-rails-pipeline]: https://github.com/vigetlabs/gulp-rails-pipeline
