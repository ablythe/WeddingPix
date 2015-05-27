class CreateInstagramApi < ActiveRecord::Migration
  def change
    create_table :instagram_apis do |t|
      t.string :key
      t.belongs_to :user
    end
  end
end
