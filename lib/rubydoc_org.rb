require "rubydoc_org/version"
require "rubydoc_org/core_ext/object"

# Avoid polluting the global namespace by stuffing the helper methods in here:
module RubyDocOrg

  def self.url_for(class_name, method_name = nil)
    prefix = "http://ruby-doc.org/core-#{RUBY_VERSION}"
    class_page = "#{class_name}.html"

    if method_name.nil?
      method_part = ''
    else
      method_escaped = method_name
        .gsub(/[^A-Za-z_]/) { |c| c.ord.to_s(16).upcase + '-'}
        .chomp('-')
      method_part = "##{method_escaped}-method"
    end

    "#{prefix}/#{class_page}#{method_part}"
  end

  # Define the appropriate browser... thing.
  case RUBY_PLATFORM
  when /darwin/i
    def self.launch_browser(url)
      system('open', url)
    end
  when /linux/i
    def self.launch_browser(url)
      system('xdg-open', url)
    end
  else
    raise "I don't know how to launch the browser in #{RUBY_PLATFORM}..."
  end

  def self.class_url(cls)
    class_name = cls.to_s
    url_for(class_name)
  end

  def self.method_url(cls, name)
    ancestor = cls.ancestors.find { |parent|
      parent.instance_methods(false).include? name
    }
    raise "Could not find :#{name} in #{cls}!" if ancestor.nil?

    class_name = ancestor.to_s
    method_name = name.to_s

    url_for(class_name, method_name)
  end
end
