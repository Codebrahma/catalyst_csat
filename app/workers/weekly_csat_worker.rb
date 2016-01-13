class WeeklyCsatWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { weekly.day(:friday) }

  def perform
    CsatConfig
    .where(frequency: 'weekly')
    .includes(:project)
    .each do | csat_config |
      CsatMailer.csat_link(csat_config, [csat_config.to_email]).deliver rescue nil
    end
  end
end
