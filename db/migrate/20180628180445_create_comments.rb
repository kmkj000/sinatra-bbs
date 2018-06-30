class CreateComments < ActiveRecord::Migration[5.2]
  def change
		create_table :comments do |t| #=> この引数名「:comments」がテーブル名になる
      t.VARCHAR(100) :name
      t.text :body
      t.timestamps  #=> この一行でcreated_atとupdated_atのカラムが定義される
  end
end
