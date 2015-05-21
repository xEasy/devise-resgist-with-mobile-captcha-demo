class AddMobileToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :integer

    add_index :users, :mobile, unique: true
  end
end
