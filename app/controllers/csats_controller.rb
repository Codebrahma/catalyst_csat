class CsatsController < ApplicationController
  before_filter :load_project, :authorize, only: :index

  def index
    
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end
end
