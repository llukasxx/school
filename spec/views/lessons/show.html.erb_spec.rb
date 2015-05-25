require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :name => "Name",
      :teacher_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
