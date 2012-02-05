#require 'log4r'

CONFIG_FILE = ENV['CONFIG_FILE'] || "#{::Rails.root.to_s}/config/shout_config.yml"

Forum3::Application.config.shoutconfig = HashWithIndifferentAccess.new(
  :floodlers => 9001)

ShoutConf = Forum3::Application.config.shoutconfig

def load_config_file(config_file)
  begin
    config_file = File.open(config_file)
  rescue Errno::ENOENT => e
    $stderr.puts
    $stderr.puts "!!! Config file #{config_file.inspect} does not exist!"
    $stderr.puts
    raise e
  rescue Errno::EACCES => e
    $stderr.puts
    $stderr.puts "!!! Config file #{config_file.inspect} is not readable (permission denied)!"
    $stderr.puts
    raise e
  rescue => e
    $stderr.puts
    $stderr.puts "!!! Config file #{config_file.inspect} could not be read!"
    $stderr.puts
    raise e
  end
  
  ShoutConf.merge! HashWithIndifferentAccess.new(YAML.load(config_file))
end


#def init_logger
#  Rails.logger = Log4r::Logger.new("")
  #Rails.logger.trace = true
  
#  if ShoutConf[:log_level]
#    case YunoConf[:log_level].upcase
#      when "DEBUG"
#        Rails.logger.level = Log4r::DEBUG
#      when "INFO"
#        Rails.logger.level = Log4r::INFO
#      when "WARN"
#        Rails.logger.level = Log4r::WARN
#      when "ERROR"
#        Rails.logger.level = Log4r::ERROR
#      when "FATAL"
#        Rails.logger.level = Log4r::FATAL
#    end
#  else
#    Rails.logger.level = Log4r::WARN
#  end
#  
  # Log4r::StderrOutputter.new "console"
#  Log4r::FileOutputter.new("logfile",
#    :filename => "log/#{RAILS_ENV}.log",
#    :trunc => true,
#    :trace => true,
#    :formatter => Log4r::PatternFormatter.new(:pattern => "[%d] %5l -- : %1M"))
    #:formatter => Log4r::PatternFormatter.new(:pattern => "[%d] %t %5l -- : %1M"))
    
#  Rails.logger.add("logfile")
#end


load_config_file(CONFIG_FILE)
#init_logger
