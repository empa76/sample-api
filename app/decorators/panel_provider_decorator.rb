require 'nokogiri'

class PanelProviderDecorator < Draper::Decorator
  delegate_all

  TIME_URL = URI.parse('http://time.com')
  NEWS_URL = URI.parse('http://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news')

  def price
    case object.code
      when 'red' then calculate_red
      when 'green' then calculate_green
      when 'blue' then calculate_blue
    end
  end

  private

  def calculate_red
    page = Net::HTTP.get(TIME_URL)
    page.count('a') / 100
  end

  def calculate_green
    page = Net::HTTP.get(NEWS_URL)
    page.to_s.scan(/\\u003cb\\u003e/).count
  end

  def calculate_blue
    page = Net::HTTP.get(TIME_URL)
    document = Nokogiri.parse(page)
    document.xpath('//*').count / 100
  end
end
