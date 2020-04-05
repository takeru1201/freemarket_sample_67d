# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.varchar(30) :nickname,        null: false
      t.varchar(50) :last_name,       null: false
      t.varchar(50) :first_name,      null: false
      t.varchar(50) :last_name_kana,  null: false
      t.varchar(50) :first_name_kana, null: false
      t.string :address,              null: false
      t.integer(32) :phone_number,    null: false
      t.text :self_introduction
      t.integer :sales
      t.integer :point
      t.text :icon
      t.string :email,                null: false, default: ""
      t.string :encrypted_password,   null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
    add_index :nickname, unique: true
    add_index :phone_number, unique: true
    add_index :password, unique: true
    add_index :reset_password_token, unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end



