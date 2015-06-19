class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :name
      t.integer :pages

      t.timestamps
    end
  end
end
