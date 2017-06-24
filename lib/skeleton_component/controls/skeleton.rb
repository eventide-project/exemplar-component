module SkeletonComponent
  module Controls
    module Skeleton
      def self.example
        skeleton = SkeletonComponent::Skeleton.build

        skeleton.id = self.id
        skeleton.something_happened_time = Time::Effective::Raw.example

        skeleton
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      module New
        def self.example
          SkeletonComponent::Skeleton.build
        end
      end

      module Identified
        def self.example
          skeleton = New.example
          skeleton.id = Skeleton.id
          skeleton
        end
      end
    end
  end
end
