require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:create_project) { 
    click_link "New Project"
    fill_in "Name", with: "Test Project"
    fill_in "Description", with: "Try out capybara"
    click_button "Create Project"
   }
   let(:edit_project) {
    click_link "Edit"
    fill_in "Name", with: "Test Project2"
    click_button "Update Project"
   }

  scenario "user creates a new project" do
    sign_in user
    visit root_path #devise create the session only, need to visit page manually

    expect {
      create_project

      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.projects, :count).by 1
  end

  scenario "user editing a project" do
    sign_in user
    visit root_path
    create_project
    edit_project

    aggregate_failures do
      expect(page).to have_content "Project was successfully updated"
      expect(page).to have_content "Test Project2"        
    end
  end
end
