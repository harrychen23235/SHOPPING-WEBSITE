# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar")
#
# 4.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

User.create!(name:  "adminuser",
             email: "adminuser@adminuser.org",
             password:              "adminuser",
             password_confirmation: "adminuser",
             admin: true)

Product.delete_all
Product.create! id: 1, name: "Bananas", price: 1.49, active: true
Product.create! id: 2, name: "Apples", price: 3.29, active: true
Product.create! id: 3, name: "Milk", price: 2.99, active: true

# OrderStatus.delete_all
# OrderStatus.create! id: 1, name: "In Progress"
# OrderStatus.create! id: 2, name: "Placed"
# OrderStatus.create! id: 3, name: "Shipped"
# OrderStatus.create! id: 4, name: "Cancelled"
