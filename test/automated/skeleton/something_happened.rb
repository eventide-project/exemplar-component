require_relative '../automated_init'

context "Skeleton" do
  context "Has Something Happened Time" do
    skeleton = Controls::Skeleton.example

    refute(skeleton.something_happened_time.nil?)

    test "Something happened" do
      assert(skeleton.something_happened?)
    end
  end

  context "Does Not Have Something Happened Time" do
    skeleton = Controls::Skeleton::New.example

    assert(skeleton.something_happened_time.nil?)

    test "Is not initiated" do
      refute(skeleton.something_happened?)
    end
  end
end
