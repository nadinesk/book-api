class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :books, :likes, :integer, :default => 0
  end
end
