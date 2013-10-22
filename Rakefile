
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc "Updates the fake Bootstrapper"
task :lib do
  sh "cd src && javac org/neo4j/server/Bootstrapper.java"
  sh "cd src && jar -cvf ../lib/bootstrapper.jar ."
end


Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => :features