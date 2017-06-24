module SkeletonComponent
  module Messages
    module Events
      class SomethingHappened
        include Messaging::Message

        attribute :skeleton_id, String
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
