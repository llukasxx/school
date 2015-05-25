feature "admin can" do
  
  scenario "create new appropriate teacher" do
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

  scenario "not create new inappropriate teacher" do
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

  scenario "edit teacher" do
    teacher = create(:teacher)
    visit edit_admin_teacher_path(teacher)
    within("#edit_teacher_#{teacher.id}") do
      fill_in 'teacher_first_name', with: "Mateusz"
    end

    click_button 'Update Teacher'

    expect(page).to have_content "Mateusz"
  end

  scenario "delete teacher" do
    teacher = create(:teacher)
    teacher.first_name = "Donald"
    teacher.save
    visit admin_teachers_path
    expect(page).to have_content "Donald"
    click_link("teacher#{teacher.id}")
    expect(page).to have_content "Teacher successfully destroyed"
    expect(page).not_to have_content "Donald"
  end

  scenario "view particular teacher" do
    teacher = create(:teacher)
    teacher.first_name = "Jan"
    teacher.save
    visit admin_teacher_path(teacher)
    expect(page).to have_content "Jan"
  end


end