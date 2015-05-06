#encoding: utf-8

When /^I am on the (.*) page$/ do |current_page|
    current_page = (current_page == 'home') ? 'index' : current_page
    visit 'http://bvcil.dev-ruby.chrismurray.me/' + current_page
end

Then /^I can navigate to the (.*) page$/ do |new_page|
    new_page = (new_page == 'home') ? 'index' : new_page
    visit 'http://bvcil.dev-ruby.chrismurray.me/' + new_page
end

Then /^I see "(.*)"$/ do |display_content|
   expect(page).to have_content(display_content) 
end
