module SkeletonComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :skeleton

    # TODO Implement event projection blocks
    # eg:
    # apply SomethingHappened do |something_happened|
    #   SetAttributes.(skeleton, something_happened, copy: [
    #     { :skeleton_id => :id }
    #   ])

    #   something_happened_time = Clock.parse(something_happened.time)

    #   skeleton.something_happened_time = something_happened_time
    # end
  end
end
