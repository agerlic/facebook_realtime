namespace :fb do
  namespace :rt do
    include FacebookRealTime
    
    desc "list all subscriptions"
    task :list => :environment do
      sub = Subscription.new
      sub.list
    end

    desc "delete all subscriptions"
    task :delete => :environment do
      sub = Subscription.new
      sub.delete
    end

    desc "add or modify a subscription"
    task :subscribe, :object, :fields, :callback_url, :needs => :environment do |t, args|
      sub = Subscription.new
      sub.add(args.object, args.fields, args.callback_url)
    end
  end
end