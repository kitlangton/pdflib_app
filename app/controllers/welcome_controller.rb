class WelcomeController < ApplicationController
  def index
    PdfMaker.create
  end
end
