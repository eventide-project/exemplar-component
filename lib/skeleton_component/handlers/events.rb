module SkeletonComponent
  module Handlers
    class Events
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      handle SomethingHappened do |something_happened|
        # If pertinent, react to the SomethingHappened event
      end
    end
  end
end
