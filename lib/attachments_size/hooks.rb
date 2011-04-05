module AttachmentsSize
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head,
      :partial => 'hooks/attachments_size/view_layouts_base_html_head'
  end
end
