class CreateArtciles < ActiveRecord::Migration[7.0]
  def change
    create_table :artciles do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
