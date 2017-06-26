module SkeletonComponent
  module Handlers
    class Events
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      # TODO Implement event handler blocks
      # Note: Delete if not handling events

      # handle SomethingHappened do |something_happened|
      # end
    end
  end
end
