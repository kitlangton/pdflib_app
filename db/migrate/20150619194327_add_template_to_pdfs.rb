class AddTemplateToPdfs < ActiveRecord::Migration
  def change
    add_column :pdfs, :template, :string
  end
end
