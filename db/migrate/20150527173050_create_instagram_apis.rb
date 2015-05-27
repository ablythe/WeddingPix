class CreateInstagramApis < ActiveRecord::Migration
  def change
    create_table :instagram_apis do |t|

      t.timestamps null: false
    end
  end
end
