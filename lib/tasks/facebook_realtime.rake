namespace :fb do
  namespace :rt do
    include FacebookRealtime
    
    desc "list all subscriptions"
    task :list => :environment do
      FacebookRealtime.list
    end

    desc "delete all subscriptions"
    task :delete => :environment do
      FacebookRealtime.delete
    end

    desc "add or modify a subscription"
    task :subscribe, :object, :fields, :callback_url, :needs => :environment do |t, args|
      FacebookRealtime.add(args.object, args.fields, args.callback_url)
    end
  end
end