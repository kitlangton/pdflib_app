class PdfsController < ApplicationController

  def index
    @pdf = Pdf.last
  end

  def new
    @pdf = Pdf.new
  end

  def create
    @pdf = Pdf.new(pdf_params)
    PdfMaker.create(params[:pdf][:name])
    @pdf.template = Rails.root.join('tmp/stamp_pages.pdf').open
    if @pdf.save
      redirect_to root_path
    end
  end

  private

  def pdf_params
    params.require(:pdf).permit(:name,:template)
  end
end
