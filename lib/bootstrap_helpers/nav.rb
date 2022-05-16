module BootstrapHelpers
  class Nav < BootstrapHelpers::Base
    def initialize(view_context)
      @ac = view_context
    end

    def item(icon, title, url, options = {}, &block)
      bs_render template: 'nav/item', options: options, locals: { the_icon: icon, title: title, url: url }, block: block
    end
  end
end
