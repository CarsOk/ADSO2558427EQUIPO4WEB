# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Order.delete_all
Destination.delete_all
User.delete_all
Company.delete_all
Description.delete_all
Beginning.delete_all
Company.create(razonSocial: "Domitransp SAS", nit: "900512424")
User.create(email: "prueba@gmail.com", password: "prueba1234", company_id:"1", nombre:"Juan", apellido:"Hernandez")
Description.create(objeto:"Sobre")
Description.create(objeto:"Paquete")
Description.create(objeto:"Cava")
Description.create(objeto:"Caja")
Description.create(objeto:"Contenedor")
Description.create(objeto:"Maleta")
Beginning.create(ciudad:"Barranquilla")
Beginning.create(ciudad:"Sincelejo")
Beginning.create(ciudad:"Cartagena")
Beginning.create(ciudad:"Santa Marta")
Beginning.create(ciudad: "Valledupar")
Beginning.create(ciudad:"Monteria")
Destination.create(ciudad:"Barranquilla")
Destination.create(ciudad:"Sincelejo")
Destination.create(ciudad:"Cartagena")
Destination.create(ciudad:"Santa Marta")
Destination.create(ciudad: "Valledupar")
Destination.create(ciudad:"Monteria")