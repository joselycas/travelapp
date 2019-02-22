# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Dolly Adams", email: "dolly@adams.com", password: "password", budget: 1200)
User.create(name: "Barnes Noble", email: "barnes@noble.com", password: "password", budget: 1300)
User.create(name: "Ronald Rots", email: "ronald@rots.com", password: "password", budget: 450)
User.create(name: "Malcolm Rich", email: "malcolm@rich.com", password: "password", budget: 1600)


Destination.create(country: "Thailand", state: "Kho Tao")
Destination.create(country: "Vietnam", state: "Ho Chi Min")
Destination.create(country: "Mexico", state: "Guadalajara")
Destination.create(country: "Jamaica", state: "Negril")

Activities.create(country: "Thailand", state: "Kho Tao")
Activities.create(country: "Vietnam", state: "Ho Chi Min")
Activities.create(country: "Mexico", state: "Guadalajara")
Activities.create(country: "Jamaica", state: "Negril")
