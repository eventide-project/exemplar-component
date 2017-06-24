require_relative '../../automated_init'

context "Handle Commands" do
  context "DoSomething" do
    context "Ignored" do
      handler = Handlers::Commands.new

      skeleton = Controls::Skeleton.example

      assert(skeleton.something_happened?)

      handler.store.add(skeleton.id, skeleton)

      do_something = Controls::Commands::DoSomething.example

      handler.(do_something)

      writer = handler.write

      something_happened = writer.one_message do |event|
        event.instance_of?(Messages::Events::SomethingHappened)
      end

      test "SomethingHappened event is not written" do
        assert(something_happened.nil?)
      end
    end
  end
end
