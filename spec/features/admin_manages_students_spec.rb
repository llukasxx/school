feature "admin can" do
  
  scenario "create new appropriate student" do
    visit new_admin_student_path
    within("#new_student") do
      fill_in 'student_first_name', with: "Mark"
      fill_in 'student_last_name', with: "Carlberg"
      fill_in 'student_email', with: "email@example.com"
      fill_in 'student_password', with: "password"
      fill_in 'student_password_confirmation', with: "password"
    end

    click_button 'Create Student'

    expect(page).to have_content "Student created"

  end

  scenario "not create new inappropriate student" do
    visit new_admin_student_path
    within("#new_student") do
      fill_in 'student_first_name', with: "John"
      fill_in 'student_last_name', with: "Smith"
      fill_in 'student_email', with: "email@example.com"
      fill_in 'student_password', with: "passw"
      fill_in 'student_password_confirmation', with: "passwo"
    end

    click_button 'Create Student'

    expect(page).to have_content "Sth went wrong"

  end

  scenario "edit student" do
    student = create(:student)
    visit edit_admin_student_path(student)
    within("#edit_student_#{student.id}") do
      fill_in 'student_first_name', with: "Mateusz"
    end

    click_button 'Update Student'

    expect(page).to have_content "Mateusz"
  end

  scenario "delete student" do
    student = create(:student)
    student.first_name = "Tusk"
    student.save
    visit admin_students_path
    expect(page).to have_content "Tusk"
    click_link("student#{student.id}")
    expect(page).to have_content "Student successfully destroyed"
    expect(page).not_to have_content "Tusk"
  end

  scenario "view particular teacher" do
    student = create(:student)
    student.first_name = "Jan"
    student.save
    visit admin_student_path(student)
    expect(page).to have_content "Jan"
  end


end