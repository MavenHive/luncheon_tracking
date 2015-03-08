class Settings < Settingslogic
  source "#{Rails.root}/config/application.yml.erb"
  namespace Rails.env
  load!

  def self.grasshopper_account_features_url
    "#{Settings.grasshopper_mailer_url}/#/settings/plan"
  end
end
