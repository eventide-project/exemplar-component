module SkeletonComponent
  module Controls
    module Commands
      module DoSomething
        def self.example
          do_something = SkeletonComponent::Messages::Commands::DoSomething.build

          do_something.skeleton_id = Skeleton.id
          do_something.time = Time::Effective.example

          do_something
        end
      end
    end
  end
end
