class CreateBbs < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
