# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(first_name: "Adam", last_name: "Nowak", email: "admin@example.com", password: "password", password_confirmation: "password")

3.times do |i|
  Group.create(name: "1k44#{i+1}")
end

20.times do
  t = Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
                 email: Faker::Internet.email, password: "password", password_confirmation: "password")
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
                 email: Faker::Internet.email, password: "password", password_confirmation: "password",
                 group_id: rand(1..3))
  rand(1..5).times do
    GroupTeacher.create(teacher_id: t.id, group_id: rand(1..3))
  end
end

10.times do
  l = Lesson.create(name: Faker::Lorem.word.capitalize)
  rand(1..3).times do
    GroupLesson.create(lesson_id: l.id, group_id: rand(1..3))
  end
end


