module ContentAlert
  class Alert
    def self.run
      Config.all.each do |config|
        fetcher = Fetcher.new(config)

        if fetcher.content_exists? ^ !config.appear
          Growl.notify("#{config.name} matches.")

          if config.launch_browser
            Launchy.open(config.uri)
          end
        else
          puts "#{config.name} does not match."
        end
      end
    end
  end
end
