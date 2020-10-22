class ChangeDataTitleToBook < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :title, :string
  end
end
