module Grease
  class Adapter
    def initialize(template_class)
      @template_class = template_class
    end

    def call(input)
      context = input[:environment].context_class.new(input)
      template = @template_class.new { input[:data] }

      # TODO: Hack for converting ActiveSupport::SafeBuffer into String
      data = template.render(context, {}).to_str
      context.metadata.merge(data: data)
    end

    def inspect
      "#<#{self.class.name}(#{@template_class.name}):#{format('%#016x', object_id << 1)}>"
    end
  end
end
