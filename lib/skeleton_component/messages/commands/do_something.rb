module SkeletonComponent
  module Messages
    module Commands
      class DoSomething
        include Messaging::Message

        attribute :skeleton_id, String
        attribute :time, String
      end
    end
  end
end
