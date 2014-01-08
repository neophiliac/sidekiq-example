class CreateSiteStats < ActiveRecord::Migration
  def change
    create_table :site_stats do |t|
      t.string :url
      t.integer :page_bytes
      t.text :page

      t.timestamps
    end
  end
end
