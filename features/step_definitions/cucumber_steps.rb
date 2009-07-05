Given /^a Rails app with Cucumber$/ do
  system "rails rails_root"
  @rails_root = File.join(File.dirname(__FILE__), "..", "..", "rails_root")
  require 'cucumber'
end

When /^I generate a "([^\"]*)" feature for "([^\"]*)"$/ do |feature, resource|
  system "cd #{@rails_root} && " <<
         "script/generate feature #{resource} #{feature} && " <<
         "cd .."
end

Then /^a "posts" feature for the "create" scenario should be generated$/ do
  assert_generated_file("features/posts.feature") do
    "  Scenario: Create a new post\n"                 <<
    "    Given I am on the new post page\n"           <<
    "    When I create a 'post' named 'A new post'\n" <<
    "    Then I should see 'A new post'"
  end
end

Then /^a "posts" step definition should be generated$/ do
  assert_generated_file("features/step_definitions/posts_steps.rb") do
    "When /^I create a post named \"([^\\\"]*)\"$/ do |name|\n" <<
    "  fills_in :name, :with => name\n"                         <<
    "  click_button 'Create'\n"
    "end"
  end
end

