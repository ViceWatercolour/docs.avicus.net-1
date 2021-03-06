helpers do
  def label text, type="primary"
    "<span class='label label-#{type}'>#{text}</span>"
  end

  def required
    "<span class='label label-danger'><i class='fa fa-exclamation'></i></span>"
  end
end

module Haml::Filters::Yaml
  include Haml::Filters::Base

  def render(text)
    text = Haml::Helpers.preserve text.strip!
    "<pre><code class='language-yaml'>" + text + "</code></pre>"
  end
end

page "*", :layout => "layout"
page "/modules/*", :layout => "module"

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

activate :directory_indexes

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end
