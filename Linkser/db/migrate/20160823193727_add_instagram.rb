class AddInstagram < ActiveRecord::Migration
  def change
    create_table :instagram do |t|
      t.string :name
      t.string :url
      t.string :times_visited
      t.string :category
      t.string :tags
      t.text :description
      t.string :content_type
      t.timestamps
    end
  end
end
