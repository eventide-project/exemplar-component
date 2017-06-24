module SkeletonComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :skeleton

      handle DoSomething do |do_something|
        skeleton_id = do_something.skeleton_id

        skeleton, version = store.fetch(skeleton_id, include: :version)

        if skeleton.something_happened?
          logger.info(tag: :ignored) { "Command ignored (Command: #{do_something.message_type}, Skeleton ID: #{skeleton_id})" }
          return
        end

        something_happened = SomethingHappened.follow(do_something)

        something_happened.processed_time = clock.iso8601

        stream_name = stream_name(skeleton_id)

        write.(something_happened, stream_name, expected_version: version)
      end
    end
  end
end
