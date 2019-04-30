class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    #テーブルを作成する命令。テーブル名はモデル名の小文字かつ複数形。
    create_table :messages do |t|
      #contentカラムの追加
      
      t.string :content
      #created_at,update_atカラムの追加
      t.timestamps
    end
  end
end
