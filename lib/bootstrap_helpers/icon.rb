module BootstrapHelpers
  class Icon
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def self.render(name)
      if File.exist?("#{Rails.root}/app/icons/#{name}.svg")
        File.open("#{Rails.root}/app/icons/#{name}.svg").read.html_safe
      else
        File.open("#{__dir__}/../../icons/#{name}.svg").read.html_safe
      end
    rescue Errno::ENOENT
      'X'.html_safe
    end

    def self.enumerate
      output = []
      Dir::foreach(__dir__ + '/../../icons/') do |filename|
        next if filename == '.' || filename == '..'
        next if File.directory? filename

        output << File.basename(filename, File.extname(filename))
      end
      output
    end

    private

    def bs_render(template:, locals: {}, &block)
      raise ArgumentError, 'template is not formatted correctly, should be section/fragment' if template.split('/').length != 2

      section = template.split('/').first
      fragment = template.split('/').last
      content = locals[:content]
      content = @ac.capture(self, &block) if block_given?
      @ac.render(partial: "helpers/bootstrap/#{section}/#{fragment}", locals: locals.merge({ content: content }))
    end
  end
end
