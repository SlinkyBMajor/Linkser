class AddSites < ActiveRecord::Migration
  def change

    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :times_visited
      t.string :category
      t.string :tags
      t.text :description

      t.timestamps
    end

  end
end
