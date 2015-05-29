feature "admin" do
  scenario "sees proper teachers on lessons" do
    teacher = create(:teacher)
    lesson = create(:lesson)
    group = create(:group)
    group_teacher = build(:group_teacher)
    group_lesson = build(:group_lesson)

    group_teacher.group_id = group.id
    group_teacher.teacher_id = teacher.id

    group_lesson.group_id = group.id
    group_lesson.lesson_id = lesson.id

    group_teacher.save
    group_lesson.save

    visit admin_lesson_path(lesson)
    expect(page).to have_content(teacher.first_name)
    expect(page).to have_content(teacher.last_name)
  end
end