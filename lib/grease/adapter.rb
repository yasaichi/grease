module Grease
  class Adapter
    def initialize(template_class)
      @template_class = template_class
    end

    def call(input)
      context = input[:environment].context_class.new(input)
      template = @template_class.new { input[:data] }

      # TODO: Hack for converting ActiveSupport::SafeBuffer into String
      output = "#{template.render(context, {})}"
      context.metadata.merge(data: output)
    end
  end
end
