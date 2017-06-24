module SkeletonComponent
  module Controls
    module Events
      module SomethingHappened
        def self.example
          something_happened = SkeletonComponent::Messages::Events::SomethingHappened.build

          something_happened.skeleton_id = Skeleton.id
          something_happened.time = Time::Effective.example
          something_happened.processed_time = Time::Processed.example

          something_happened
        end
      end
    end
  end
end
