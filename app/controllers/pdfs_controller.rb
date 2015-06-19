class PdfsController < ApplicationController
  def index
  end
  def new
    @pdf = Pdf.new
  end
  def create
    PdfMaker.create(params[:pdf][:name])
    redirect_to pdfs_path
  end
  private
end
