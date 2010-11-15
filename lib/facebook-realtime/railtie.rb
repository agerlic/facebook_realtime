require 'facebook-realtime'
require 'rails'
module FacebookRealTime
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/facebook-realtime.rake'
    end
  end
end