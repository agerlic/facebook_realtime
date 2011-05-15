namespace :facebook_realtime do
  include FacebookRealtime
  
  desc "List each of your subscribed objects and their subscribed fields"
  task :list => :environment do
    FacebookRealtime.list
  end

  desc "Delete all subscriptions"
  task :delete => :environment do
    FacebookRealtime.delete
  end

  desc "Add or modify a subscription"
  task :subscribe, :object, :fields, :callback_url, :needs => :environment do |t, args|
    FacebookRealtime.add(args.object, args.fields, args.callback_url)
  end
end
