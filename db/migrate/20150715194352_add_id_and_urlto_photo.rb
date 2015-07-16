class AddIdAndUrltoPhoto < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.string :insta_url
      t.string :insta_id
    end
  end
end
