require('capybara/rspec')
require('launchy')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the triangle path', {:type => :feature}) do
  it('processes the user entry and returns whether it is a triangle and, if so, what type') do
    visit('/')
    fill_in('side1', :with => '5')
    fill_in('side2', :with => '2')
    fill_in('side3', :with => '4')
    click_button('check')
    expect(page).to have_content('scalene')
  end
end
