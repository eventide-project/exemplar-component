require_relative '../../automated_init'

context "Handle Commands" do
  context "DoSomething" do
    context "SomethingHappened" do
      handler = Handlers::Commands.new

      processed_time = Controls::Time::Processed::Raw.example

      handler.clock.now = processed_time

      do_something = Controls::Commands::DoSomething.example

      skeleton_id = do_something.skeleton_id or fail
      effective_time = do_something.time or fail

      skeleton_stream_name = "skeleton-#{skeleton_id}"

      handler.(do_something)

      writer = handler.write

      something_happened = writer.one_message do |event|
        event.instance_of?(Messages::Events::SomethingHappened)
      end

      test "SomethingHappened event is written" do
        refute(something_happened.nil?)
      end

      test "Written to the skeleton stream" do
        written_to_stream = writer.written?(something_happened) do |stream_name|
          stream_name == skeleton_stream_name
        end

        assert(written_to_stream)
      end

      context "Attributes" do
        test "skeleton_id" do
          assert(something_happened.skeleton_id == skeleton_id)
        end

        test "time" do
          assert(something_happened.time == effective_time)
        end

        test "processed_time" do
          processed_time_iso8601 = Clock.iso8601(processed_time)

          assert(something_happened.processed_time == processed_time_iso8601)
        end
      end
    end
  end
end
