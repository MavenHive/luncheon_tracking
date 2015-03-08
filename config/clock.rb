require 'clockwork'

module Clock
  every(1.day, 'Send SMS for food', at: '12:00') do
    NotifyCatererWorker.perform_async
  end
end