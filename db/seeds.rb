# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Players

Player.create({name: 'Agustin Guerra', email: 'agustingr10@gmail.com'})
Player.create({name: 'Mauricio Martinez', email: 'maumar2000@gmail.com'})
Player.create({name: 'Carlos Navas', email: 'carlosnavas1986@gmail.com'})
Player.create({name: 'Esteban Hourcade Rochon', email: 'hourcadeesteban@gmail.com'})
Player.create({name: 'Nicolas Jakubowski', email: 'njakubowski@codigodelsur.com'})
Player.create({name: 'Matias De Brun', email: 'mdebrun@codigodelsur.com'})
Player.create({name: 'Gabriel Velazquez', email: 'gvelazquez@codigodelsur.com'})
Player.create({name: 'Williams Olivera', email: 'wolivera@codigodelsur.com'})
Player.create({name: 'Diego Arena Olivera', email: 'degendao@gmail.com'})
Player.create({name: 'Jeremias Nunez', email: 'jereman_gnr@hotmail.com'})
Player.create({name: 'Sergio Oxley', email: 'oxsean2@gmail.com'})
Player.create({name: 'Rodrigo Lopetegui', email: 'rlopetegui@codigodelsur.com'})
Player.create({name: 'Ignacio Rodrigo', email: 'irodrigo17@gmail.com'})
Player.create({name: 'Agustin De Leon', email: 'adeleon@codigodelsur.com'})
Player.create({name: 'Nicolas Bermudez', email: 'tcuentoq@gmail.com'})
Player.create({name: 'Federico Viñas', email: 'fefo888@hotmail.com'})
Player.create({name: 'Pablo Arismendes', email: 'parismendes@codigodelsur.com'})
Player.create({name: 'Hernán Albano', email: 'hernanalbano@gmail.com'})
Player.create({name: 'Damian Delgado', email: 'damiandel620cds@gmail.com'})
Player.create({name: 'Nicolas Torres', email: 'ntorres@codigodelsur.com'})
Player.create({name: 'Constanza Fernández', email: 'constanzafernandezn@gmail.com'})
Player.create({name: 'Valentin Moscone', email: 'vmoscone@codigodelsur.com'})
Player.create({name: 'Jorge Melgar', email: 'jmelgar@codigodelsur.com'})
Player.create({name: 'Diego Varangot', email: 'dvarangot@codigodelsur.com'})
Player.create({name: 'Juan Olivera', email: 'juanolio04@gmail.com'})
Player.create({name: 'Emiliano Barcia', email: 'desde.alaska@gmail.com'})


# Matches

match = Match.create({date: '2015-02-04T19:00:00', place: 'River'})
match.players.append([
  Player.find_by_email('hourcadeesteban@gmail.com'),
  Player.find_by_email('irodrigo17@gmail.com'),
  Player.find_by_email('agustingr10@gmail.com'),
  Player.find_by_email('tcuentoq@gmail.com'),
  Player.find_by_email('carlosnavas1986@gmail.com'),
  Player.find_by_email('desde.alaska@gmail.com'),
  Player.find_by_email('gvelazquez@codigodelsur.com'),
  Player.find_by_email('adeleon@codigodelsur.com'),
  Player.find_by_email('njakubowski@codigodelsur.com'),
  Player.find_by_email('degendao@gmail.com'),
  Player.find_by_email('jereman_gnr@hotmail.com')
])
match.save

match = Match.create({date: '2015-02-06T20:00:00', place: 'River'})
match.players.append([
  Player.find_by_email('hourcadeesteban@gmail.com'),
  Player.find_by_email('irodrigo17@gmail.com'),
  Player.find_by_email('maumar2000@gmail.com'),
  Player.find_by_email('adeleon@codigodelsur.com')
])
match.save
