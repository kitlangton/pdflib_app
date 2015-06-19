class Pdf < ActiveRecord::Base
  mount_uploader :template, TemplateUploader
end
