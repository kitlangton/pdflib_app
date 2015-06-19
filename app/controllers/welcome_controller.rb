class WelcomeController < ApplicationController
  def index
    PDFMaker.go
  end
end
