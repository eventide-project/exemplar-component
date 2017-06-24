require_relative '../../automated_init'

context "Handle Commands" do
  context "Transfer" do
    context "Expected Version" do
      handler = Handlers::Commands.new

      do_something = Controls::Commands::DoSomething.example

      skeleton = Controls::Skeleton::Identified.example

      version = Controls::Version.example

      handler.store.add(skeleton.id, skeleton, version)

      handler.(do_something)

      writer = handler.write

      something_happened = writer.one_message do |event|
        event.instance_of?(Messages::Events::SomethingHappened)
      end

      test "Is the entity's version" do
        written_to_stream = writer.written?(something_happened) do |_, expected_version|
          expected_version == version
        end

        assert(written_to_stream)
      end
    end
  end
end
