class CsatsController < ApplicationController
  # before_filter :authorize, only: :index
  before_filter :load_project, :authorize, only: :index
  before_filter :load_csat_config, :authorize, only: :index
  before_filter :load_using_encrypted_id, only: [:new, :create]

  def index
    @csats = Csat.where(project_id: @project.id).includes(:survey)
  end

  def new
    @survey = Survey.new
  end

  def create
    survey = Survey.new(survey_params)
    if survey.save
      Csat.create(project_id: @project.id, survey_id: survey.id, created_at: Time.now)
      flash[:notice] = 'Thank You for your feedback.'
      redirect_to '/'
    else
      flash[:warning] = 'An error occurred while submitting the feedback. Please try again.'
      render :new
    end
  end

  private

  def load_project
    @project = ::Project.find_by(identifier: params[:project_id])
    @project_encrypted_id = ::Services::Project.new(@project).encrypted_id
  end

  def load_using_encrypted_id
    id = ::Services::Project.find_by_encrypted_id(params[:project_id])
    @project = ::Project.find(id) if id
  end

  def load_csat_config
    @csat_config = CsatConfig.find_by(project_id: @project.id) || CsatConfig.new
  end

  def survey_params
    params.require(:survey).permit(:delivered_as_promised, :delivered_on_time, :satisfaction, :pros, :improvements)
  end
end
