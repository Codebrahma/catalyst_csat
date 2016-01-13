class CsatMailer < Mailer
  def csat_link(csat_config, to_emails, cc_emails=[])
    @csat_config = csat_config
    @project = csat_config.project
    @link = Services::Project.new(@project).csat_url

    mail to: to_emails, cc: cc_emails, subject: 'Customer Feedback Form - ' + @project.name
  end
end
