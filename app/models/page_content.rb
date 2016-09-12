class PageContent < ApplicationRecord

  def self.get_page_contents
    result_hash = {}
    PageContent.all.each do |page_content|
      result_hash[page_content.url] = page_content.content
    end
    result_hash
  end
end