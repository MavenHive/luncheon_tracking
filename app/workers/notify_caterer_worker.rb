class NotifyCatererWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 3

  def perform
    twilio_sid = Settings.twilio_sid
    twilio_token = Settings.twilio_token
    twilio_phone_number = Settings.twilio_phone_number

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => Settings.number_to_send_to,
      :body => "We would need #{User.lunch_in_office.count} lunch(es) today. Thank you."
    )
  end
end