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

ActiveRecord::Schema.define(version: 2018_06_05_174247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "configuracoes", force: :cascade do |t|
    t.string "nome_empresa"
    t.boolean "quiosque"
    t.boolean "turmas"
    t.boolean "salas"
    t.boolean "usar_impressora"
    t.string "nome_impressora"
    t.string "layout_etiqueta"
    t.boolean "usar_fotos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.bigint "pessoa_id"
    t.integer "responsavel_id"
    t.datetime "data_evento"
    t.integer "tipo_evento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_eventos_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.integer "grupo", default: 1, null: false
    t.string "familia"
    t.string "telefone"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "cep"
    t.integer "password"
    t.string "primeiro_nome"
    t.string "celular"
    t.boolean "receber_sms"
    t.string "sexo"
    t.date "nascimento"
    t.text "observacoes"
    t.integer "familia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "turma_id"
    t.bigint "sala_id"
    t.string "email"
    t.boolean "checkin", default: false, null: false
    t.datetime "data_evento"
    t.index ["sala_id"], name: "index_pessoas_on_sala_id"
    t.index ["turma_id"], name: "index_pessoas_on_turma_id"
  end

  create_table "salas", force: :cascade do |t|
    t.string "nome_sala"
    t.string "descricao"
    t.integer "capacidade"
    t.integer "turma_de"
    t.integer "turma_ate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "nome_turma"
    t.string "descricao"
    t.integer "idade_inicial"
    t.integer "idade_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "configuracao_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["configuracao_id"], name: "index_usuarios_on_configuracao_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "eventos", "pessoas"
  add_foreign_key "pessoas", "salas"
  add_foreign_key "pessoas", "turmas"
  add_foreign_key "usuarios", "configuracoes"
end
