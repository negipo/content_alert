AGENT_FILE_NAME = 'org.polog.contentalert.plist'
AGENT_DIR = File.expand_path('~/Library/LaunchAgents/')

task :install do
  sh 'bundle install'

  file = open("data/#{AGENT_FILE_NAME}").read.gsub('...', File.expand_path(File.dirname(__FILE__)))
  agent_dest = File.join(AGENT_DIR, AGENT_FILE_NAME)
  File.open(agent_dest, 'w').write file
  sh "launchctl load -w #{agent_dest}"
end
