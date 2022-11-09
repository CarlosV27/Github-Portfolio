# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create 2 users


# create a doctor for user1
# doctor1 = Doctor.create(speciality: "Cardiologo", photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F336815780322368418%2F&psig=AOvVaw2Q2g2vJ6eQ2l8mY6b5K6Yc&ust=1634648074242000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjBp6W5jPMCFQAAAAAdAAAAABAD", consulting_room: "Calle 123 # 45-67", user_id: 18)
# doctor2 = Doctor.create(speciality: "Oftalmologo", photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F336815780322368418%2F&psig=AOvVaw2Q2g2vJ6eQ2l8mY6b5K6Yc&ust=1634648074242000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjBp6W5jPMCFQAAAAAdAAAAABAD", consulting_room: "Calle 123 # 45-67", user_id: 19)

# # create a pacient for user3
# pacient1 = Pacient.create(height: "1.80", weight: "80", blood: "A+", diseases: "Diabetes", zone: "Norte", church: "Iglesia de la calle 123", postal_code: "12345", user_id: 20, doctor_id: 3)
# # pacient2 = Pacient.create(height: "1.70", weight: "70", blood: "B+", diseases: "Hipertension", zone: "Sur", church: "Iglesia de la calle 123", postal_code: "12345", user_id: 21, doctor_id: 19)


# # create users
# user = User.create([
#     {
#         name: "Juan", email: "eljuan@gmail.com", password: "123456", age: "70", gender: "Masculino", city: "Bogota", state: "Colombia"
#     }, 
#     {
#         name: "Maria", email: "lamaria@gmail.com", password: "123456", age: "90", gender: "Femenino", city: "Bogota", state: "Colombia", 
#     },
#     {
#         name: "Pedro", email: "elpedro@gmail.com", password: "123456", age: "69" , gender: "Masculino", city: "Bogota", state: "Colombia"
#     },
#     {
#         name: "David Cantú", email: "davidcantu@tec.com", password: "123456", age: "40", gender: "Masculino", city: "Monterrey", state: "Mexico"
#     },
#     {
#         name: "Rafael Davalos", email: "rafaeldav@tec.com", password: "123456", age:"65", gender: "Masculino", city: "Monterrey", state: "Mexico"
#     },
#     {
#         name: "Hector", email: "hector@iepam.com", password: "123456", age: "60", gender: "Masculino", city: "Monterrey", state: "Mexico"
#     },
#     {
#         name: "Daniel", email: "daniel@iepam.com", password: "123456", age: "40", gender: "Masculino", city: "Monterrey", state: "Mexico"
#     },
#     {
#         name: "Luis", email: "admin@iepam.com", password: "123456", age: "30", gender: "Masculino", city: "Monterrey", state: "Mexico" 
#     }
# ])

# # create doctors
# doctor = Doctor.create([
#     {
#         speciality: "Cardiologo", photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F336815780322368418%2F&psig=AOvVaw2Q2g2vJ6eQ2l8mY6b5K6Yc&ust=1634648074242000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjBp6W5jPMCFQAAAAAdAAAAABAD", consulting_room: "Calle 123 # 45-67", user_id: 26
#     },
#     {
#         speciality: "Oftalmologo", photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F336815780322368418%2F&psig=AOvVaw2Q2g2vJ6eQ2l8mY6b5K6Yc&ust=1634648074242000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjBp6W5jPMCFQAAAAAdAAAAABAD", consulting_room: "Calle 123 # 45-67", user_id: 27
#     }
# ])

# create pacients
pacient = Pacient.create([
    {
        height: "1.80", weight: "80", blood: "A+", diseases: "Diabetes", zone: "Norte", church: "Iglesia de la calle 123", postal_code: "12345", user_id: 38, doctor_id: 27
    },
    {
        height: "1.70", weight: "70", blood: "B+", diseases: "Hipertension", zone: "Sur", church: "Iglesia de la calle 123", postal_code: "12345", user_id: 39, doctor_id: 27
    }
])


# add pacients_id to users
    User.all.each do |user|
        if user.pacient_id.nil?
            # if a pacient has the same id as user 
            if Pacient.find_by(user_id: user.id)
                user.pacient_id = Pacient.find_by(user_id: user.id).id
                user.save
                puts "Pacient #{pacient} id added to user #{user.id}"
            end        
        end
    end



    # puts "All pacients data"
    