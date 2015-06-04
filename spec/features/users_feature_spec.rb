require 'rails_helper'

context "user not signed in and on the homepage" do
  it "sees a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end
  it "does not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end

context "user signed in on the homepage" do
  before do
    sign_up
  end
  it "sees 'sign out' link" do
    expect(page).to have_link('Sign out')
  end
  it "does not see a 'sign in' link and a 'sign up' link" do
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end