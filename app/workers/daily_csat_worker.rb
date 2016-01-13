class DailyCsatWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

  def perform
    CsatConfig
    .where(frequency: 'daily')
    .includes(:project)
    .each do | csat_config |
      CsatMailer.csat_link(csat_config, [csat_config.to_email]).deliver rescue nil
    end
  end
end
