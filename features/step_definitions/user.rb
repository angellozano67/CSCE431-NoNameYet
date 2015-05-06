Then /^I fill in the signup form$/ do
    fill_in('user_name', :with => 'Test User')
    fill_in('user_email', :with => 'testuser@example.com')
    fill_in('user_password', :with => '12345')
    fill_in('user_password_confirmation', :with => '12345')
    fill_in('user_address', :with => '123 Fake Street')
    fill_in('user_organization', :with => 'Fakers Inc.')
    click_button 'Create my account'
end
