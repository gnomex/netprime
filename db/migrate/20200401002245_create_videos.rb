class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :slug, null: false, default: "", index: true
      t.string :url, null: false, index: true
      t.string :name, null: false
      t.integer :view_count, default: 0
      t.references :user

      t.timestamps
    end
  end
end
