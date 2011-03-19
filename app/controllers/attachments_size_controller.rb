class AttachmentsSizeController < ApplicationController
  unloadable
  before_filter :require_admin
  def index
    @total_size = Attachment.sum('filesize')
    @projects = Project.all
    @size_by_projects = {}
    Attachment.find(:all).each do |attachment|
      case attachment.container_type 
      when 'Issue'
        @size_by_projects[Issue.find(attachment.container_id).project] ||= 0
        @size_by_projects[Issue.find(attachment.container_id).project] += attachment.filesize
      when 'Project'
        @size_by_projects[Project.find(attachment.container_id)] ||= 0 
        @size_by_projects[Project.find(attachment.container_id)] += attachment.filesize
      end
    end
  end
end
