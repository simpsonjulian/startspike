require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 5
  @dirs = [File.join(File.dirname(__FILE__), '..', '..')]
end


