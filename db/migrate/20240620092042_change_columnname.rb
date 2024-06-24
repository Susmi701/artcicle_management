class ChangeColumnname < ActiveRecord::Migration[7.0]
  def change
    rename_table :artciles, :articles
  end
end
