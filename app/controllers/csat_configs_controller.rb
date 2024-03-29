class CsatConfigsController < ApplicationController
  before_filter :load_related_project, :authorize, only: [:create]
  before_filter :load_csat_config, :authorize, only: [:update, :trigger]

  def create
    if @project.present? and CsatConfig.create(csat_config_params).id?
      flash[:notice] = "CSAT details saved successfully."
    else
      flash[:warning] = "CSAT details could not be saved. Please try again."
    end
    redirect_to "/csats?project_id=#{@project.identifier}"
  end

  def trigger
    CsatMailer.csat_link(@csat_config, [@csat_config.to_email]).deliver rescue nil
    flash[:notice] = "CSAT email triggered successfully."
    redirect_to "/csats?project_id=#{@csat_config.project.identifier}"
  end

  def update
    if @project.present? and @csat_config.update(update_params)
      flash[:notice] = "CSAT details saved successfully."
    else
      flash[:warning] = "CSAT details could not be saved. Please try again."
    end
    redirect_to "/csats?project_id=#{@project.identifier}"
  end

  private

  def load_csat_config
    @csat_config = CsatConfig.find(params[:id])
    if @csat_config.id?
      @project = @csat_config.project
    end
  end

  def load_related_project
    @project = Project.find(csat_config_params[:project_id])
  end

  def csat_config_params
    params.require(:csat_config).permit(:message, :frequency, :to_email, :project_id)
  end

  def update_params
    params.require(:csat_config).permit(:message, :frequency, :to_email)
  end
end
