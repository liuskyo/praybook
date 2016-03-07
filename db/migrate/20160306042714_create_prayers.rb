class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
    	t.string :title
    	t.text :content
    	t.integer :user_id,:index=>true
    	t.integer :category_id,:index=>true
      t.timestamps null: false
    end
  end
end
