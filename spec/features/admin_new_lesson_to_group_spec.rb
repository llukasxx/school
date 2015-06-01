feature "admin" do
  scenario "can add new teacher to a group" do
    lesson = create(:lesson)
    group = create(:group)

    visit add_lesson_admin_group_assignments_path
    within("#new_group_lesson") do
      select lesson.name, from: "group_lesson_lesson_id"
      select group.name, from: "group_lesson_group_id"
    end

    click_button "Create"

    expect(page).to have_content("Assignment has been saved")

  end

  scenario "cant add new teacher to the same group" do
    lesson = create(:lesson)
    group = create(:group)

    group_lesson = create(:group_lesson, lesson_id: lesson.id, group_id: group.id)

    visit add_lesson_admin_group_assignments_path
    within("#new_group_lesson") do
      select lesson.name, from: "group_lesson_lesson_id"
      select group.name, from: "group_lesson_group_id"
    end

    click_button "Create"

    expect(page).to have_content("Something went wrong")
  end

end