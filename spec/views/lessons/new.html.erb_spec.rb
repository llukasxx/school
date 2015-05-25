require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :name => "MyString",
      :teacher_id => 1
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", admin_lessons_path, "post" do

      assert_select "input#lesson_name[name=?]", "lesson[name]"
    end
  end
end