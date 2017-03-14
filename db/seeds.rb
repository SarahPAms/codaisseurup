User.destroy_all

pooky = User.create(email: "pooky@zenmoustache.com", password: "1234xyz")
event = Event.create(name: "massage practicum", description:"get rubbed the right way", location: "here", price: 0, capacity: 10, includes_food: false, includes_drink: true, starts_at: 10.days.from_now, user: pooky)
