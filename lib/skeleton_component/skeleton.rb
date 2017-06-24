module SkeletonComponent
  class Skeleton
    include Schema::DataStructure

    attribute :id, String
    attribute :something_happened_time, Time

    def something_happened?
      !something_happened_time.nil?
    end
  end
end
