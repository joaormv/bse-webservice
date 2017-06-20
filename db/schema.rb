# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170217162651) do

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       limit: 45, null: false
    t.string   "cpf",        limit: 14, null: false
    t.string   "rg",         limit: 15, null: false
    t.string   "matricula",  limit: 20, null: false
    t.string   "senha",      limit: 10
    t.date     "data_nasc"
    t.string   "orgao",      limit: 30
    t.string   "tel",        limit: 15, null: false
    t.string   "tel2",       limit: 15
    t.string   "convenio",   limit: 10, null: false
    t.string   "email",      limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "emprestimos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.float    "valor",           limit: 24, null: false
    t.integer  "qnt_parcelas",    limit: 3,  null: false
    t.float    "valor_parcelas",  limit: 24, null: false
    t.date     "data_emprestimo"
    t.string   "banco",           limit: 40, null: false
    t.string   "corretora",       limit: 40
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "enderecos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.string   "rua",         limit: 45, null: false
    t.bigint   "numero",                 null: false
    t.string   "complemento", limit: 45
    t.string   "bairro",      limit: 45, null: false
    t.string   "cidade",      limit: 45, null: false
    t.string   "estado",      limit: 2,  null: false
    t.string   "cep",         limit: 9,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "operadors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user",            limit: 45
    t.string   "hashed_password"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
