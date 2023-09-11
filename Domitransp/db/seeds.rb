# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pack.delete_all
Order.delete_all
User.delete_all
Company.delete_all
Company.create(razonSocial: "Domitransp SAS", nit: "900512424")
User.create(email: "prueba@gmail.com", password: "prueba1234", company_id: 1, nombre:"Juan", apellido:"Hernandez", admin: false)
Order.create(fecha: "2023-07-04", consecutivo: 1234, avatar: nil, destino: "Cartagena", origen: "Sincelejo")
Pack.create(tipo: "Sobre", cantidad: 2, order_id: 1)
User.create(email: "admin@gmail.com", password: "admin123", company_id: 5, nombre:"Juan", apellido:"Vides", admin: true )
