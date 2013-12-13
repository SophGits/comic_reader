module ParserHelper

  class FeedParser
  end

  class ExplosmFeedParser < FeedParser
    def get_strips(feed)
      rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)

      rss_feed.entries.each do |entry|
        entry_url = entry.url
        page_content = Nokogiri::HTML(open(entry_url))

        page_content.css("#maincontent div div img").each do |img|
          img_url = img.attribute("src").value

          if /Comics/ =~ img_url
            strip = Strip.new
            strip.strip_url = img_url
            strip.feed = feed
            strip.save

            break
          end
        end
      end
    end
  end

end
