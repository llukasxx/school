feature "admin" do

  scenario "adds new student to group" do
    student = create(:student)
    group = create(:group)
    visit add_student_admin_group_assignments_path
    within(".simple_form") do
      select "#{student.last_name} #{student.first_name}", from: "student_student_id"
      select group.name, from: "student_group_id"
    end

    click_button "Update"

    expect(page).to have_content(student.first_name)

    expect(page).to have_content(group.name)

  end

end