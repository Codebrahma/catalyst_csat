require_relative './app/services/project'
require_relative './app/models/csat_mailer'

Redmine::Plugin.register :catalyst_csat do
  name 'Catalyst CSAT plugin'
  author 'Abhishek Sarkar'
  description 'Automates the client feedback flow.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :csats do
    permission :view_csats, csats: :index
  end
  menu :project_menu, :CSATs, { controller: 'csats', action: 'index' }, caption: 'CSAT', param: :project_id
end
require_relative './app/workers/daily_csat_worker'
DailyCsatWorker.perform_async
require_relative './app/workers/weekly_csat_worker'
WeeklyCsatWorker.perform_async
require_relative './app/workers/monthly_csat_worker'
MonthlyCsatWorker.perform_async
