class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
	  t.boolean :verified, default: false
	  t.boolean :isadmin, default: false
      t.string :name
	  t.string :password_digest
	  t.string :remember_token
	  t.string :remember_digest
	  t.string :notes
	  t.string :address
	  t.string :organization
	  t.string :insuranceprovider
	  t.string :policynum
    end
  end
end
