class MonthlyCsatWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { monthly.day_of_month(28) }

  def perform
    CsatConfig
    .where(frequency: 'monthly')
    .includes(:project)
    .each do | csat_config |
      CsatMailer.csat_link(csat_config, [csat_config.to_email]).deliver rescue nil
    end
  end
end
