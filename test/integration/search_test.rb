require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest

  test "search for item in database works" do 
    visit root_path
    assert_equal root_path, current_path

    link = Link.create(:title => "Home of Captain Rocket Pants", :url => "http://www.crp.com")
    fill_in 'q', :with => 'rocket'
    
    click_button 'Search'

    assert_equal search_path, current_path
    assert_equal page.has_content?('Rocket'), true
  end

  test "search for item NOT in database works" do 
    visit root_path
    assert_equal root_path, current_path

    link = Link.create(:title => "Home of Spongebob Square Pants", :url => "http://www.ssp.com")
    fill_in 'q', :with => 'patrick'

    click_button 'Search'

    assert_equal search_path, current_path
    assert_equal page.has_content?('no titles that match'), true
  end
end