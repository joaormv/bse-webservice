# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#puts "Criando tipos de operador"

#OperadorTipo.create([{ tipo: 'Administrador' }, { tipo: 'Operador' }])

#puts "Tipos de operador criados ... [OK]"

puts "Criando tipos de contratos..."

Agreement.create!(
	[
		{ description: 'PMSP'}, 
		{ description: 'GOVERNO DE SÃO PAULO'}, 
		{ description: 'INSS'},
		{ description: 'SIAPE'}
	]
)

puts "Tipos de contratos criados com sucesso."