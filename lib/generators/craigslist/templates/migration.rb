class AddCraigslistPostingsTable < ActiveRecord::Migration
  def self.up
    create_table :craigslist_postings, :force => true do |t|
      t.string :title
      t.string :link
      t.text :description
      t.datetime :posted_at
      t.string :language
      t.string :rights
      t.timestamps
    end
    add_index :craigslist_postings, [:title, :posted_at], :unique => true
  end

  def self.down
    drop_table :craigslist_postings
  end
end
