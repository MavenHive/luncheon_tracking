class NotifyCatererWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 3

  def perform
    puts "Send SMS about lunch for #{User.lunch_in_office.count}"
  end
end