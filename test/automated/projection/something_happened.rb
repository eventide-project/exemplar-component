require_relative '../automated_init'

context "Projection" do
  context "Initiated" do
    skeleton = Controls::Skeleton::New.example

    assert(skeleton.id.nil?)
    assert(skeleton.something_happened_time.nil?)

    something_happened = Controls::Events::SomethingHappened.example

    skeleton_id = something_happened.skeleton_id or fail
    something_happened_time_iso8601 = something_happened.time or fail

    Projection.(skeleton, something_happened)

    test "ID is set" do
      assert(skeleton.id == skeleton_id)
    end

    test "Something Happened Time" do
      something_happened_time = Clock.parse(something_happened_time_iso8601)

      assert(skeleton.something_happened_time == something_happened_time)
    end
  end
end
