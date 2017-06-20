namespace :utils do
  desc "Zerar  e popular o banco de dados"
  task seed: :environment do

  	puts "Criando clientes"

	Cliente.create!(

		nome: "João",
		cpf: "368.013.388-03",
		rg: "46624010-7",
		data_nasc: Date.today,
		matricula: "46549163",
		senha: "scasdcas", 
		orgao: "escola", 
		tel: "(11) 2949-5704", 
		tel2: "(11) 98488-6199", 
		convenio: "PMSP", 
		email: "joao@ruby.com.br"
)

puts "Clientes criados ... [OK]"

puts "Criando emprestimos"

Emprestimo.create!(

		valor: 10000,
		qnt_parcelas: 10,
		valor_parcelas: 1000,
		banco: "BMG",
		corretora: "Magma",
		cliente: Cliente.first
	)

puts "Emprestimos criados ... [OK]"

puts "Criando endereços"

Endereco.create!(

		rua: "Maria José Barroso",
		numero: 59,
		complemento: "",
		bairro: "Vila Maria",
		cidade: "São Paulo",
		estado: "SP",
		cep: "02136-020",
		cliente: Cliente.first
	)

puts "Endereços criados ... [OK]"

  end

end
