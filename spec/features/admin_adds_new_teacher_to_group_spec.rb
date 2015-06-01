feature "admin" do
  scenario "can add new teacher to a group" do
    teacher = create(:teacher)
    group = create(:group)

    visit new_admin_group_assignment_path(type: "teacher")
    within("#new_group_teacher") do
      select "#{teacher.first_name} #{teacher.last_name}", from: "group_teacher_teacher_id"
      select group.name, from: "group_teacher_group_id"
    end

    click_button "Create"

    expect(page).to have_content("Assignment has been saved")

  end

  scenario "cant add new teacher to the same group" do
    teacher = create(:teacher)
    group = create(:group)

    group_teacher = create(:group_teacher, teacher_id: teacher.id, group_id: group.id)

    visit new_admin_group_assignment_path(type: "teacher")
    within("#new_group_teacher") do
      select "#{teacher.first_name} #{teacher.last_name}", from: "group_teacher_teacher_id"
      select group.name, from: "group_teacher_group_id"
    end

    click_button "Create"

    expect(page).to have_content("Something went wrong")
  end

end