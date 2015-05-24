feature "admin" do
  
  scenario "creates new appropriate teacher" do
    visit new_admin_teacher_path
    within("#new_teacher") do
      fill_in 'teacher_first_name', with: "John"
      fill_in 'teacher_last_name', with: "Smith"
      fill_in 'teacher_email', with: "email@example.com"
      fill_in 'teacher_password', with: "password"
      fill_in 'teacher_password_confirmation', with: "password"
    end

    click_button 'Create Teacher'

    expect(page).to have_content "Teacher created"

  end

  scenario "creates new bad teacher" do
    visit new_admin_teacher_path
    within("#new_teacher") do
      fill_in 'teacher_first_name', with: "John"
      fill_in 'teacher_last_name', with: "Smith"
      fill_in 'teacher_email', with: "email@example.com"
      fill_in 'teacher_password', with: "passw"
      fill_in 'teacher_password_confirmation', with: "passwo"
    end

    click_button 'Create Teacher'

    expect(page).to have_content "Sth went wrong"

  end


end