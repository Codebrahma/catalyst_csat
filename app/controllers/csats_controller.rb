class CsatsController < ApplicationController
  before_filter :load_project, :authorize, only: :index
  before_filter :load_using_encrypted_id, only: [:new, :create]

  def index
  end

  def new
    @survey = Survey.new
  end

  def create
    survey = Survey.new(survey_params)
    if survey.save
      Csat.create(project_id: @project.id, survey_id: survey.id)
      flash[:notice] = 'Thank You for your feedback.'
      redirect_to '/'
    else
      flash[:warning] = 'An error occurred while submitting the feedback. Please try again.'
      render :new
    end
  end

  private

  def load_project
    @project = ::Project.find(params[:project_id])
  end

  def load_using_encrypted_id
    id = ::Services::Project.find_by_encrypted_id(params[:project_id])
    @project = ::Project.find(id) if id
  end

  def survey_params
    params.require(:survey).permit(:delivered_as_promised, :delivered_on_time, :satisfaction, :pros, :improvements)
  end
end
