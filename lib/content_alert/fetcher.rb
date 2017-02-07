require 'open-uri'

module ContentAlert
  class Fetcher
    def initialize(config)
      @config = config
    end

    def content_exists?
      Nokogiri::HTML(body).css(@config.css).each do |element|
        return true if @config.regexp === element.to_s
      end

      false
    end

    def body
      Retryable.retryable(tries: 10, on: OpenURI::HTTPError, sleep: 5) do
        @body ||= open(@config.uri).read
      end
    end
  end
end
