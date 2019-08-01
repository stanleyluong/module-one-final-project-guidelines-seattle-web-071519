User.destroy_all

asif = User.create(username:"Asif")
steve = User.create(username:"Steve")
stan = User.create(username:"Stan")

NPC.destroy_all
alex = NPC.create(name:"Alex", age: 25, favorite_drink: "mimosa")
taylor = NPC.create(name:"Taylor",age: 25, favorite_drink: "mimosa")
bobby = NPC.create(name:"Bobby",age: 25, favorite_drink: "mimosa")

