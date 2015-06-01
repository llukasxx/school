feature "admin" do
  scenario "can add new teacher to a group" do
    teacher = create(:teacher)
    group = create(:group)

    visit add_teacher_admin_group_assignments_path
    within("#new_group_teacher") do
      select "#{teacher.last_name} #{teacher.first_name}", from: "group_teacher_teacher_id"
      select group.name, from: "group_teacher_group_id"
    end

    click_button "Create"

    expect(page).to have_content("Assignment has been saved")

  end

  scenario "cant add new teacher to the same group" do
    teacher = create(:teacher)
    group = create(:group)

    group_teacher = create(:group_teacher, teacher_id: teacher.id, group_id: group.id)

    visit add_teacher_admin_group_assignments_path
    within("#new_group_teacher") do
      select "#{teacher.last_name} #{teacher.first_name}", from: "group_teacher_teacher_id"
      select group.name, from: "group_teacher_group_id"
    end

    click_button "Create"

    expect(page).to have_content("Something went wrong")
  end

end