module ContentAlert
  class Alert
    def self.run
      Config.all.each do |config|
        fetcher = Fetcher.new(config)

        if fetcher.content_exists?
          Growl.notify("#{config.name} exists.")

          if config.launch_browser
            Launchy.open(config.uri)
          end
        end
      end
    end
  end
end
