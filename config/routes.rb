ActionController::Routing::Routes.draw do |map|
  map.connect 'attachments_size/:action', :controller => 'attachments_size'
end
