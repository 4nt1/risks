class Logorrhea < ActiveSupport::Logger::SimpleFormatter
  def call(severity, time, progname, msg)

    case severity
      when 'INFO'
        result = "#{msg.strip} \n"
      when 'DEBUG'
        result = "(^_^) #{msg.strip}\n".cyan if msg.present?
      when 'WARN'
        result = "(O_o) #{msg.strip}\n".bold.yellow
      when 'ERROR'
        result = "(@_@) #{msg.strip} \n".red
      when 'FATAL'
        result = "(X_x) ".red + "#{msg.strip.underline.red}\n"
      when 'UNKNOWN'
        result = "#{msg.strip} \n".underline.cyan_on_yellow
    end
    result
  end
end