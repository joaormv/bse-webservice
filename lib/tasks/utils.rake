namespace :utils do
    desc "Zerar  e popular o banco de dados"
    task seed: :environment do

    	puts "Criando clientes"

  	Cliente.create!(

  		nome: "João",
  		cpf: "368.013.388-03",
  		rg: "46624010-7",
  		data_nasc: Date.today,
  		tel: "(11) 2949-5704", 
  		tel2: "(11) 98488-6199",  
  		email: "joao@ruby.com.br"
  )

  puts "Clientes criados ... [OK]"

  puts "Criando cargos"

  Position.create!(

    funcao: "Professor",
    orgao: "Escola Dom Pedro I",
    matricula: "46549163",
    senha: "scasdcas",
    agreement: Agreement.first,
    cliente: Cliente.first
  )

  puts "Cargos criados ... [OK]"

  puts "Criando emprestimos"

  Emprestimo.create!(

  		valor: 10000,
  		qnt_parcelas: 10,
  		valor_parcelas: 1000,
  		banco: "BMG",
  		corretora: "Magma",
  		cliente: Cliente.first,
      agreement: Agreement.first
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

#  puts "Criando operadores"

#  Operador.create!(

#    user: "joao",
#    password: "12345678",
#    operador_tipo: OperadorTipo.find(1)
#    )

#  puts "Operadores criados ... [OK]"


  end

end
