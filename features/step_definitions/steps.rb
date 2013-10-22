Given(/^I clean up Neo droppings$/) do
  FileUtils.rm_f([ 'tmp/foo.log', 'data/log/console.log'])
end

When(/^I wait for (\d+) second$/) do |time|
  sleep time.to_i
end