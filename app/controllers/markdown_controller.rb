class MarkdownController < ApplicationController
  def preview
    respond_to do |format|
      format.html { render html: view_context.markdown(params[:content]) }
    end
  end
end
