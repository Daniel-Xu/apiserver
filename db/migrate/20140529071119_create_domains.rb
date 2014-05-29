class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.integer :account_id
      t.string :hostname
      t.string :ip

      t.timestamps
    end
  end
end
