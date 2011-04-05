require 'redmine'

require_dependency 'attachments_size/hooks'

Redmine::Plugin.register :redmine_attachments_size do
  name 'Redmine Attachments Size plugin'
  author '@suer'
  description 'Display atachments size plugin'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://d.hatena.ne.jp/suer'

  menu :admin_menu, :attachments_size, {:controller => 'attachments_size'}, :caption => 'Attachments size'
end
