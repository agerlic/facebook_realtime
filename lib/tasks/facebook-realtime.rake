namespace :fb do
  namespace :rt do
    include FacebookRealTime
    
    desc "list all subscriptions"
    task :list => :environment do
      FacebookRealTime.list
    end

    desc "delete all subscriptions"
    task :delete => :environment do
      FacebookRealTime.delete
    end

    desc "add or modify a subscription"
    task :subscribe, :object, :fields, :callback_url, :needs => :environment do |t, args|
      FacebookRealTime.add(args.object, args.fields, args.callback_url)
    end
  end
end