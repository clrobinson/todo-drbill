User.destroy_all
User.create!(name: "test", password: "foobar")
User.first.lists.create(name: "Test List")
List.first.items.create(content: "Do the complicated thing.", due_date: 1.day.ago.to_date)
List.first.items.create(content: "Do the simple thing.", due_date: 2.days.from_now.to_date)
List.first.items.create(content: "Do the other thing.", due_date: 14.days.from_now.to_date)
List.first.items.create(content: "Relax.")