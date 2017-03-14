Category.destroy_all
User.destroy_all

miriam = User.create!(
   email: "miriam@codaisseurup.com",
   password: "abcd1234",)


 event = Event.create!(
   name: "Monthly Yoga Weekend",
   description: "Let's come together and practice some asanas together in the woods!",
   location: "Amsterdam",
   includes_food: false,
   includes_drink: true,
   price: 10.00,
   starts_at: 10.days.from_now,
   ends_at: 12.days.from_now,
   capacity: 100,
   active: true,
   user: miriam,
 )

 Category.create!([
   { name: "Movements" },
   { name: "Outdoors & Adventure" },
   { name: "Tech" },
   { name: "Family" },
   { name: "Health & Wellness" },
   { name: "Sports & Fitness" },
   { name: "Learning" },
   { name: "Photography" },
   { name: "Food & Drink" },])
