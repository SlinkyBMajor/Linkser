class AddContentTypeSite < ActiveRecord::Migration
  def change
    change_table :sites do |t|
      t.string :content_type
    end
  end
end
