require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :name => "MyString",
      :teacher_id => 1
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", admin_lesson_path(@lesson), "post" do

      assert_select "input#lesson_name[name=?]", "lesson[name]"
    end
  end
end
