require 'spec_helper'

# 2013-07-08 直接從書上拷貝下來的
feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', with: 'TextMate 2'
    fill_in 'Description', with: 'A text-editor for OS X'
    click_button 'Create Project'
    expect(page).to have_content('Project has been created.')

    project = Project.where(name: "TextMate 2").first
    expect(page.current_url).to eql(project_url(project))
    title = "TextMate 2 - Projects - Ticketee"
    expect(find("title").native.text).to have_content(title)
  end

  # 有些碼和上面的單測是相同的
  # 但是我故意不執行 DRY，看看以後是不是比較看得懂
  scenario "can not create a project without a name" do
    visit '/'
    click_link 'New Project'
    click_button 'Create Project'
    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
