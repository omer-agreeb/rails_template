Resque.redis = $redis
Resque.logger = Logger.new(Rails.root.join('log', "resque_#{Rails.env}.log"))
