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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120627123423) do

  create_table "aspectos", :force => true do |t|
    t.integer  "punto_id"
    t.integer  "tipoaspecto_id"
    t.string   "nombre"
    t.boolean  "valor"
    t.string   "peso"
    t.string   "justificacion"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "proyectos", :force => true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "responsable"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "puntos", :force => true do |t|
    t.integer  "proyecto_id"
    t.integer  "tipopunto_id"
    t.string   "nombre"
    t.date     "fecha"
    t.float    "tiempo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tipoaspectos", :force => true do |t|
    t.integer  "tipopunto_id"
    t.string   "nombre"
    t.string   "peso"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tipopuntos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
