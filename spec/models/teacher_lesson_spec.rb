require 'rails_helper'

RSpec.describe TeacherLesson, type: :model do
  describe "attributes" do
    it "must be valid" do
      teacher_lesson = build(:teacher_lesson)
      teacher_lesson.teacher_id = nil
      expect(teacher_lesson).not_to be_valid
    end
  end
end
