feature "admin" do
  scenario "sees proper teachers on lessons" do
    lesson = create(:lesson)
    teacher = create(:teacher)
    teacher_lesson = build(:teacher_lesson)
    teacher_lesson.teacher_id = teacher.id
    teacher_lesson.lesson_id = lesson.id
    teacher_lesson.save
    visit admin_lesson_path(lesson)
    expect(page).to have_content(teacher.first_name)
    expect(page).to have_content(teacher.last_name)
  end
end