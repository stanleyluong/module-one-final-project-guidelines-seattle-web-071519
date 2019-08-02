User.destroy_all

asif = User.create(username:"Asif")
steve = User.create(username:"Steve")
stan = User.create(username:"Stan")

Npc.destroy_all
alex = Npc.create(name:"Alex", age: 25, favorite_drink: "Mimosa")
taylor = Npc.create(name:"Taylor",age: 25, favorite_drink: "Jack & Coke")
bobby = Npc.create(name:"Bobby",age: 25, favorite_drink: "Vodka Tonic")

Relationship.destroy_all
Relationship.create(user:steve, npc:taylor, points:95)
Relationship.create(user:steve, npc:alex, points:30)


rel = Relationship.find_by(user: steve, npc: alex)
puts rel
puts rel.points