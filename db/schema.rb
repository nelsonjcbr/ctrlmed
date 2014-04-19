# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20090326020026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clilabs", force: true do |t|
    t.string   "nm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exames", force: true do |t|
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicamentos", force: true do |t|
    t.string   "descricao"
    t.string   "dose"
    t.integer  "viaaplic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.string "nm_paciente"
    t.date   "dt_nascimento"
    t.string "estado_civil"
    t.string "cor"
    t.string "naturalidade"
    t.string "endereco"
    t.string "bairro"
    t.string "cidade"
    t.string "uf",               limit: 2
    t.string "profissao"
    t.string "empresa"
    t.string "fone_empresa"
    t.string "fone_casa"
    t.string "celular"
    t.string "e_mail"
    t.string "situacao"
    t.string "encaminhado_por"
    t.date   "dt_prim_consulta"
    t.date   "dt_ult_consulta"
    t.string "antec_pai"
    t.string "antec_mae"
    t.string "antec_irmaos"
    t.string "antec_filhos"
    t.text   "obs1"
    t.text   "obs2"
    t.text   "obs3"
    t.text   "obs4"
    t.text   "obs5"
    t.text   "obs6"
    t.text   "obs7"
    t.text   "obs8"
    t.string "antec_conjuge"
  end

  create_table "padraos", force: true do |t|
    t.string   "campo"
    t.text     "valores"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receitais", force: true do |t|
    t.integer  "receita_id"
    t.integer  "medicamento_id"
    t.string   "qtde"
    t.string   "dose"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receitas", force: true do |t|
    t.date     "data"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solexameis", force: true do |t|
    t.integer  "solexame_id"
    t.integer  "exame_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "obs"
  end

  create_table "solexames", force: true do |t|
    t.date     "data"
    t.integer  "clilab_id"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viaaplics", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
