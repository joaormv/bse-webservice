class Operador < ApplicationRecord

	attr_accessor :password

	#Relacionamento com o tipo de operador
	belongs_to :operador_tipo, optional: true

	#Validações
	validates_confirmation_of :password
	validates_length_of :password, :is => 8
	validates_presence_of :password, :if => :password_required?

	#Callback para encriptação de senha antes de salvar no banco
	before_save :encrypt_new_password

	#Autenticação
	#Procura e retorna o usuário se o usuario e senha estão corretos
	def self.authenticate(user, password)
		user = find_by_user(user)
		return user if user && user.authenticated?(password)
	end

	#Verifica se a senha esta correta
	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end

	######################### Bloco abaixo é protegido e só pode ser visto pela própria classe
	protected

	#Solicita a encriptação se a senha não estiver em branco
	def encrypt_new_password
		return if password.blank?
		self.hashed_password = encrypt(password)
	end

	#Verifica se a senha esta em branco
	def password_required?
		hashed_password.blank? || password.present?
	end

	#Efetua a encriptação
	def encrypt(string)
		Digest::SHA1.hexdigest(string)
	end
end
