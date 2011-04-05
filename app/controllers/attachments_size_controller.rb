class AttachmentsSizeController < ApplicationController
  unloadable
  before_filter :require_admin
  def index
    @total_size = Attachment.sum('filesize')
    @projects = Project.all
    @size_by_projects = {}
    @attachment_container_types = []
    Attachment.find(:all).each do |attachment|
      @size_by_projects[attachment.container_id] ||= {}
      @size_by_projects[attachment.container_id][attachment.container_type] ||= 0
      @size_by_projects[attachment.container_id][attachment.container_type] += attachment.filesize
      @size_by_projects[attachment.container_id][:total] ||= 0
      @size_by_projects[attachment.container_id][:total] += attachment.filesize
      @attachment_container_types << attachment.container_type unless @attachment_container_types.include?(attachment.container_type)
    end
  end
end
