require 'spec_helper'
require 'capybara/rspec'

describe "the homepage", :type => :feature do
  before :each do
    User.create!(:username => 'user', :password => 'password')
  end
  

  it "lets me access the sign up page" do
    visit '/'
    click_on("Give GCSB personal details")
    expect(page).to have_content 'Lets sign you up'
  end


  it "signs me in with correct credentials" do
    visit '/'
    within("#rainbow") do
      fill_in 'Tell us who you are', :with => 'user'
      fill_in 'Password', :with => 'password'
    end
    click_on "sign-in"
    expect(page).to have_content 'Congrats on loggin in comrade'
  end
end

describe "the sign up page", :type => :feature do

  it "signs me up" do
    visit '/sign_up'
    within("body") do
      fill_in 'Pick A User Name', :with => 'user'
      fill_in "We'll keep your new password safe :)", :with => 'password'
    end
    click_on "Sign Waiver"
    expect(page).to have_content 'Welcome to the iiIii network'
  end
end

