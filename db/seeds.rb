Photo.delete_all
Category.delete_all
Event.delete_all
Profile.delete_all
User.delete_all

#user
miriam = User.create!(
   email: "miriam@codaisseurup.com",
   password: "abcd1234",)

photo1= Photo.create!(remote_image_url: "http://res.cloudinary.com/den2bvoo7/image/upload/v1489671590/IMG_8887_vlmy0v.jpg")
photo2= Photo.create!(remote_image_url: "http://res.cloudinary.com/den2bvoo7/image/upload/v1489671635/Screen_Shot_2016-08-31_at_19.17.39_a5shfp.png")


#events
Event.create!( name: "Monthly Yoga Weekend",
description: "Let's come together and practice some asanas together in the woods!", location: "Amsterdam", includes_food: false, includes_drink: true, price: 10.00,
starts_at: 10.days.from_now, ends_at: 12.days.from_now, capacity: 100, active: true, user: miriam, photos: [photo1])

#Categories
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

puts "#{Category.all.size} categories created"

# Events
#event = Event.find_by(name: "Monthly Yoga Weekend")
#event.categories << Category.find_by(name: "Outdoors & Adventure")
#event.categories << Category.find_by(name: "Sports & Fitness")

puts "#{Event.all.size} events created"
