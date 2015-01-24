require 'yaml'

module ContentAlert
  class Config
    attr_reader :name, :uri, :css, :regexp, :launch_browser

    def initialize(
      name: nil,
      uri: nil,
      css: nil,
      regexp: nil,
      launch_browser: true
    )
      @name = name
      @uri = uri
      @css = css
      @regexp = Regexp.new(regexp, Regexp::MULTILINE)
      @launch_browser = launch_browser
    end

    def self.all
      contents = YAML.load_file('config/contents.yml')
      contents.map {|content| self.new(content) }
    end
  end
end
