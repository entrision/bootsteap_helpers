module BootstrapHelpers
  class Navbar < BootstrapHelpers::Base

    def initialize(view_context)
      @ac = view_context
    end

    def collapse(options = {}, &block)
      id = options[:id] || SecureRandom.uuid
      bs_render template: 'navbar/collapse', options: options, block: block
    end

    def items(options = {}, &block)
      bs_render template: 'navbar/list', options: options, block: block
    end

    def link(title = nil, url = '#', options = {}, &block)
      #  ' active' if @ac.current_page?(url)
      bs_render template: 'navbar/link', locals: { title: title, url: url, data: options[:data], aria: options[:aria] }, block: block, options: options
    end

    def brand(options = {})
      target ||= '/'
      bs_render template: 'navbar/brand', options: options
    end

    def toggler(target:, options: {}, &block)
      bs_render template: 'navbar/toggler', locals: { target: target }, options: options, &block
    end

  end
end
