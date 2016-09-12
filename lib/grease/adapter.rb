module Grease
  class Adapter
    def initialize(engine)
      @engine = engine
    end

    def call(input)
      context = input[:environment].context_class.new(input)
      template = @engine.new { input[:data] }
      output = template.render(context, {})

      context.metadata.merge(data: output)
    end
  end
end
