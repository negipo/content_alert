require 'open-uri'

module ContentAlert
  class Fetcher
    def initialize(config)
      @config = config
    end

    def content_exists?
      Nokogiri::HTML(open(@config.uri)).css(@config.css).each do |element|
        return true if @config.regexp === element.text
      end

      false
    end
  end
end
