feature "admin" do
  scenario "sees proper links on main page" do
    visit admin_path
    expect(page).to have_content("Teachers")
    expect(page).to have_content("Students")
    expect(page).to have_content("Lessons")
    expect(page).to have_content("Groups")
  end
end