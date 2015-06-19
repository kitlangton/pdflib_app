class PdfsController < ApplicationController
  def index
  end
  def new
    @pdf = Pdf.new
  end
  def create
    answer = PdfMaker.create(params[:pdf][:name])
    redirect_to index
  end
  private
end
