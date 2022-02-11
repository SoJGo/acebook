require 'rails_helper'

feature 'Sign up' do
  scenario 'user signs up' do
    visit "/"
    
    click_button "Sign up"
    expect(page).to have_content 'Registrations#new'
    
    # user takes name, email, password
    fill_in "Name", with: "Mat"
    fill_in "Email", with: "matt@matt.com"
    fill_in "Password", with: "Abc123"
    find('input[name="commit"]').click
    expect(page).to have_content 'User created successfully'
    expect(page).not_to have_button 'Sign up'
    expect(page).to have_button 'Log out'
    expect(page).not_to have_button 'Log in'
    expect(page).to have_content 'Logged in as: matt@matt.com'

  end

  xscenario 'user signs up with an existing email' do #still not implemented
    visit "/"
    click_button "Sign up"
    expect(page).to have_content 'Registrations#new'
    # user takes name, email, password
    fill_in "Name", with: "Mat"
    fill_in "Email", with: "matt@matt.com"
    fill_in "Password", with: "Abc123"
    find('input[name="commit"]').click

    visit "/"
    click_button "Sign up"
    expect(page).to have_content 'Registrations#new'
    # user takes name, email, password
    fill_in "Name", with: "Josh"
    fill_in "Email", with: "matt@matt.com"
    fill_in "Password", with: "Pass1234"
    find('input[name="commit"]').click

    expect(page).to have_content 

  end

end