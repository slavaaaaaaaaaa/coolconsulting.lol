source 'https://rubygems.org'

# Why not the `github-pages` meta-gem: it cannot resolve on modern Ruby. It pins
# jekyll-commonmark-ghpages -> commonmarker, which requires Ruby < 4.0, so on
# Ruby 4.x Bundler silently backtracks to Jekyll 1.x/3.9 with Liquid 4.0.3 —
# which calls the String#tainted? that Ruby 3.2 removed, and every Liquid tag
# then raises NoMethodError.
#
# GitHub Pages builds this site with its own pinned toolchain and ignores this
# Gemfile entirely (there is no Actions workflow here), so these pins exist only
# to reproduce that toolchain locally. They mirror what github-pages 232 ships.
gem 'jekyll', '~> 3.10.0'
gem 'jekyll-sass-converter', '~> 1.5'
gem 'kramdown-parser-gfm', '~> 1.1'
gem 'minima', '~> 2.5'

group :jekyll_plugins do
  gem 'jekyll-redirect-from', '~> 0.16'
  gem 'jekyll-remote-theme', '~> 0.4'
  # Pinned exactly: 2.9 emits name="twitter:*" where 2.8 emits property="twitter:*".
  # GitHub Pages is still on 2.8.0, so floating here makes local output diverge.
  gem 'jekyll-seo-tag', '2.8.0'
  gem 'jekyll-sitemap', '~> 1.4'
end

# Quiets an octokit warning during remote-theme fetches.
gem 'faraday-retry'

# Dropped from the Ruby standard library in 3.4+; Jekyll 3.x still requires them.
gem 'base64'
gem 'bigdecimal'
gem 'csv'
gem 'logger'
gem 'ostruct'
