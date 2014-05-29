class AddIndexToDomainsAccountId < ActiveRecord::Migration
  def change
    add_index :domains, :account_id
  end
end
