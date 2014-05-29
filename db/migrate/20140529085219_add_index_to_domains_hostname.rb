class AddIndexToDomainsHostname < ActiveRecord::Migration
  def change
    add_index :domains, :hostname, unique: true
  end
end
