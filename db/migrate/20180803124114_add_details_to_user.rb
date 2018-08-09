class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sex, :char
    add_column :users, :brithday, :date
  end
end
