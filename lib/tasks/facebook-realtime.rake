namespace :fb do
  namespace :rt do
    include FacebookRealTime
    desc "list subscriptions"
    task :list => :environment do
      sub = Subscription.new
      sub.list
    end

    desc "delete all"
    task :delete => :environment do
      sub = Subscription.new
      sub.delete
    end

    desc "subscribe"
    task :subscribe, :object, :fields, :callback_url, :needs => :environment do |t, args|
      sub = Subscription.new
      sub.add(args.object, args.fields, args.callback_url)
    end
  end
end