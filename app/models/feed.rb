class Feed < ActiveRecord::Base
  attr_accessible :author, :title, :down_vote_count, :logo, :feed_url, :flag_count, :keywords, :main_url, :summary, :up_vote_count, :created_at

  has_many :comments
  has_many :strips, :dependent => :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions


  def find_image feed_url

    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    page_url = feed.entries.first.url
    page_content = Nokogiri::HTML(open(page_url))
    page_content.css("#maincontent div div img").each{ |img|
      if /Comics/ =~ img.attribute("src").value
        puts "this one !!!! -> #{img.attribute("src").value}"
        # `open #{img.attribute("src").value}`
      end
      }
  end


end
