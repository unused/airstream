
When /(?:[^ ]) execute airstream/ do
  step 'I run `bundle exec ruby -Ilib bin/airstream`'
end

Then /(?:[^ ]) should see the usage message/ do
  step 'the output should contain "Usage:"'
end
