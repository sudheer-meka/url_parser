class PageContentsController < ApplicationController
  def index
    render json: {result: PageContent.get_page_contents, error_occured: 'No', status: 200}
  end

  def create
    require 'open-uri'
    require 'open_uri_redirections'
    status = 500
    begin
      if params[:url].blank?
        status = 400
        raise 'URL should not be blank.'
      end

      # open web page
      @doc = Nokogiri::HTML(open(params[:url], allow_redirections: :all))

      # to parse the web page and store content which is inside the headers and links
      content = @doc.xpath('//a | //h1 | //h2 | //h3 | //h4 | //h5| //h6').map { |el| el.content.strip unless el.content.blank? }.compact.join('; ')
      PageContent.create(url: params[:url], content: content)

      render json: {result: 'OK', error_occured: 'No', status: 200}
    rescue Exception => invalid
      message = invalid.message
      if message.include? 'No such file or directory @ rb_sysopen'
        message = 'Please enter valid URL.'
        status = 400
      end
      if message.include? 'Failed to open TCP connection'
        message = 'Could not find the web page'
        status = 400
      end
      render json: {message: message, status: status, error_occured: 'Yes'}
    end
  end
end