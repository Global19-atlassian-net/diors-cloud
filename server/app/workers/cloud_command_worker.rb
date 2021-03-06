class CloudCommandWorker
  include Sidekiq::Worker

  sidekiq_options queue: :diors_command, retry: false

  def perform(action, *args)
    Cloud::Command.const_get(action.to_s.classify).new(*args).execute
  end
end
