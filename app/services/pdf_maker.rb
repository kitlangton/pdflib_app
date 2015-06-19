require 'pdflib_wrapper'

class PdfMaker
  extend ActionView::Helpers
  extend Rails.application.routes.url_helpers
  def self.create(name)
    p pdffile = "app/assets/images" + asset_path("test.pdf").to_s
    exitcode = 0
    p searchpath = File.dirname(pdffile).to_s
    p outfile = "public/assets/stamp_pages.pdf"
    title = 'Stamp Pages'

    puts 'yo'
    p = PDFlib.new

    p.set_option("searchpath=#{searchpath}")
    p.set_option('errorpolicy=return')
    p.set_option('textformat=bytes')

    if p.begin_document(outfile, '') == -1
      puts 'error begin'
    end

    p.set_info('Creator', 'PDFlib Cookbook')
    p.set_info('Title', title + '$Revision: 1.20 $')

    indoc = p.open_pdi_document(pdffile, '')
    if indoc == -1
      puts 'error pdi'
    end

    endpage = p.pcos_get_number(indoc, 'length:pages').to_i

    optlist1 = 'fontname=Helvetica fontsize=10.5 encoding=unicode ' \
    'fillcolor={gray 0} alignment=justify'

    endpage.times do |pageno|
      page = p.open_pdi_page(indoc, pageno + 1, '')
      if page == -1
        puts 'page error'
      end

      p.begin_page_ext(10, 10, '')

      p.fit_pdi_page(page, 0, 0, 'adjustpage')
      font = p.load_font('Helvetica-Bold', 'unicode', '')
      if font == -1
        puts 'font error'
      end

      optlist1 =  'fontname=Helvetica fontsize=10.5 encoding=unicode ' \
      'fillcolor={gray 0} alignment=justify'
      tf = p.add_textflow(-1, 'oenuthoaentuhaontehuntaoh', optlist1)

      optlist = 'verticalalign=justify linespreadlimit=120% '
      p.fit_textflow(tf, 100, 20, 300, 150, optlist)

      p.fit_textline(name, 50, 150, ('font=' + font.to_s +
      ' fontsize=1 textrendering=0 boxsize={200  10} stamp=ul2lr'))
      p.close_pdi_page(page)
      p.end_page_ext('')
    end

    p.end_document('')
    image_path(File.basename(outfile))
  end
end
