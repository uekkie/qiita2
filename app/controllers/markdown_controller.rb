class MarkdownController < ApplicationController
  def preview
    # @markdown_preview_content = params[:content]
    respond_to do |format|
      format.html { render html: view_context.markdown(params[:content]) }
    end
  end
end