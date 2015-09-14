class AddNamesColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nick_name, :string
  end
  remove_index(:user_profiles, :user_id)
end
