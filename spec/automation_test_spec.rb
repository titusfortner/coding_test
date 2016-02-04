require 'spec_helper'

describe CodingTest do

  let(:page) { TestPageObject.new(@browser) }

  before(:each) do
    @browser = create_browser
  end

  after(:each) do
    @browser.quit
  end

  it 'creates a browser' do
    expect(@browser).to be_a Watir::Browser
  end

  it 'creates a chrome browser by default' do
    expect(@browser.name).to be == :chrome
  end

  it 'uses Page object to navigate' do
    page.visit
    expect(@browser.url).to be == "https://www.honestbeauty.com/products/hydrating-face-mist"
  end

  it 'uses Page object to store elements' do
    page.visit
    expect(page.add_to_bag).to be_a Watir::Span
  end

  it 'uses Page object to take action' do
    page.visit
    page.checkout
    expect(@browser.url).to include 'https://www.honest.com/log-in'
  end

end
