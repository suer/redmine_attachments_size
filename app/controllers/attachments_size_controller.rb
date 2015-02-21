class AttachmentsSizeController < ApplicationController
  unloadable
  before_filter :require_admin
  def index
    @total_size = Attachment.sum('filesize')
    @projects = Project.all
    @size_by_projects = {}
    @attachment_container_types = []
    Attachment.all.each do |attachment|
      case(attachment.container_type)
      when 'Project'
        @size_by_projects[attachment.container_id] ||= {}
        @size_by_projects[attachment.container_id][attachment.container_type] ||= 0
        @size_by_projects[attachment.container_id][attachment.container_type] += attachment.filesize
        @size_by_projects[attachment.container_id][:total] ||= 0
        @size_by_projects[attachment.container_id][:total] += attachment.filesize
      when 'WikiPage'
        wiki_page = WikiPage.find_by_id(attachment.container_id)
        if wiki_page
          @size_by_projects[wiki_page.wiki.project_id] ||= {}
          @size_by_projects[wiki_page.wiki.project_id][attachment.container_type] ||= 0
          @size_by_projects[wiki_page.wiki.project_id][attachment.container_type] += attachment.filesize
          @size_by_projects[wiki_page.wiki.project_id][:total] ||= 0
          @size_by_projects[wiki_page.wiki.project_id][:total] += attachment.filesize
        end
      when 'Document'
        document = Document.find_by_id(attachment.container_id)
        if document
          @size_by_projects[document.project_id] ||= {}
          @size_by_projects[document.project_id][attachment.container_type] ||= 0
          @size_by_projects[document.project_id][attachment.container_type] += attachment.filesize
          @size_by_projects[document.project_id][:total] ||= 0
          @size_by_projects[document.project_id][:total] += attachment.filesize
        end
      when 'Issue'
        issue = Issue.find_by_id(attachment.container_id)
        if issue
          @size_by_projects[issue.project_id] ||= {}
          @size_by_projects[issue.project_id][attachment.container_type] ||= 0
          @size_by_projects[issue.project_id][attachment.container_type] += attachment.filesize
          @size_by_projects[issue.project_id][:total] ||= 0
          @size_by_projects[issue.project_id][:total] += attachment.filesize
        end
      end
      @attachment_container_types << attachment.container_type unless @attachment_container_types.include?(attachment.container_type)
    end
  end
end
