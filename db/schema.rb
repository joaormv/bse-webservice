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

ActiveRecord::Schema.define(version: 20170713190848) do

  create_table "agreements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       limit: 45, null: false
    t.string   "cpf",        limit: 14, null: false
    t.string   "rg",         limit: 15, null: false
    t.date     "data_nasc"
    t.string   "tel",        limit: 15, null: false
    t.string   "tel2",       limit: 15
    t.string   "email",      limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "emprestimos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.integer  "agreement_id"
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

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id",               null: false
    t.integer  "agreement_id",             null: false
    t.string   "funcao",       limit: 100, null: false
    t.string   "matricula",    limit: 20,  null: false
    t.string   "senha",        limit: 10
    t.string   "orgao",        limit: 30
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
