require 'yaml'

module ContentAlert
  class Config
    attr_reader :name, :uri, :css, :regexp, :launch_browser, :appear

    def initialize(
      name: nil,
      uri: nil,
      css: nil,
      regexp: nil,
      launch_browser: true,
      appear: true
    )
      @name = name
      @uri = uri
      @css = css
      @regexp = Regexp.new(regexp, Regexp::MULTILINE)
      @launch_browser = launch_browser
      @appear = appear
    end

    def self.all
      contents = YAML.load_file('config/contents.yml')
      contents.map {|content| self.new(content) }
    end
  end
end
