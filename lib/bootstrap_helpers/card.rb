module BootstrapHelpers
  class Card < BootstrapHelpers::Base
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::UrlHelper

    def initialize(view_context)
      @ac = view_context
    end

    def card
    end

    def header(text, options = {}, &block)
      bs_render template: 'card/header', options: options, locals: { text: text }, block: block
    end

    def body(options = {}, &block)
      bs_render template: 'card/body', options: options, block: block
    end

    def title(title, options = {})
      bs_render template: 'card/title', options: options, locals: { title: title }
    end

    def subtitle(subtitle, options = {})
      bs_render template: 'card/subtitle', options: options, locals: { subtitle: subtitle }
    end

    def link(title, url, options = {})
      link_to title, url, options.merge({ class: 'card-link' })
    end

    def top_image(url, options = {})
      bs_render template: 'card/top_image', options: options, locals: { src: url }
    end

    def footer(options = {}, &block)
      bs_render template: 'card/footer', options: options, block: block
    end

    def list(options = {}, &block)
      bs_render template: 'card/list', options: options, block: block
    end

    def item(item, options = {}, &block)
      bs_render template: 'card/item', options: options, locals: { item: item }, block: block
    end
  end
end
