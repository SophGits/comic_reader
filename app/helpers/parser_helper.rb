module ParserHelper

  class FeedParser
  end

######################### GET STRIPS (should be ANY TYPE) ######################

    def get_strips(feed)
      rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)

      rss_feed.entries.each do |entry|
        if feed == "dinosaur"
          entry_url = entry.url
        else
          entry_url = entry.url
        end
        load_strip(entry_url, feed)
      end
    end

######################### EXPLOSM ####################################
  class ExplosmFeedParser < FeedParser
    def load_strip(entry_url, feed)
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

    ##### ARCHIVED EXPLOSM -- CHANGE NUMBERS FOR MORE (BUT WILL TAKE FOREVER TO PROCESS) #######
    def get_old_strips(feed)
      (3000..3020).each do |index|
        entry_url = "http://www.explosm.net/comics/" + index.to_s
        load_strip(entry_url, feed)
      end
    end

  end

######################### DILBERT ####################################
  class DilbertFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))

      page_content.css("img").each do |img|
        img_url = img.attribute("src").value

        if /zoom.gif/ =~ img_url
          strip = Strip.new
          strip.strip_url = "http://dilbert.com/" + img_url
          strip.feed = feed
          strip.save

          break
        end
      end
    end

    ######## THIS DOES NOT YET WORK ########################
    def get_old_strips(feed)
      (535..542).each do |index|
        entry_url = "http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/" + index.to_s + "/205" + index.to_s + "/205" + index.to_s + ".strip.zoom.gif"
        load_strip(entry_url, feed)
      end
    end

  end

#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/100000/90000/9000/200/199205/199205.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205536/205536.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205537/205537.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205538/205538.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205539/205539.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205540/205540.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205541/205541.strip.zoom.gif

############################# DOUGHOUSE DIARIES ################

  class DoghouseFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))

      page_content.css(".object img").each do |img|
        img_url = img.attribute("src").value

        if /comics/ =~ img_url
          strip = Strip.new
          strip.strip_url = img_url
          strip.feed = feed
          strip.save

          break
        end
      end
    end

    # def get_old_strips(feed)
    #   (34..54).each do |index|
    #     entry_url = "thedoghousediaries.com/" + index.to_s
    #     load_strip(entry_url, feed)
    #   end
    # end

  end


############################# XKCD ################

  class XkcdFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))

      page_content.css("#comic img").each do |img|
        img_url = img.attribute("src").value

        if /comics/ =~ img_url
          strip = Strip.new
          strip.strip_url = img_url
          strip.feed = feed
          strip.save

          break
        end
      end
    end

    ######## WORKS! ########################
    def get_old_strips(feed)
      (1..20).each do |index|
        entry_url = "http://xkcd.com/" + index.to_s
        load_strip(entry_url, feed)
      end
    end
  end


############################# DINOSAUR COMICS ################


  class DinosaurFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))

      page_content.css("img").each do |img|
        img_url = img.attribute("src").value

        if /comics/ =~ img_url
          strip = Strip.new
          strip.strip_url = img_url
          strip.feed = feed
          strip.save

          break
        end
      end
    end

    ######## THINK IT WORKS! ########################
    def get_old_strips(feed)
      (2500..2530).each do |index|
        entry_url = "http://www.qwantz.com/index.php?comic=" + index.to_s
        load_strip(entry_url, feed)
      end
    end
  end


############################# HARK! A VAGRANT ################ NOT WORKING (doesn't go to get_strips method)

  # class VagrantFeedParser < FeedParser
  #   def preload_strip(feed)
  #     entry_url = feed.feed_url
  #     archive_content = Nokogiri::HTML(open(entry_url))

  #     archive_content.css("tr td a").each do |get_img_link|
  #       url = get_img_link.attribute("href").value
  #       page_url = "http://www.harkavagrant.com/" + url

  #       load_strip(page_url, feed)
  #     end
  #   end

  #   def load_strip(page_url, feed)
  #     page_content = Nokogiri::HTML(open(page_url))

  #       page_content.css("img").each do |img|
  #         img_url = img.attribute("src").value

  #         if /history/ =~ img_url
  #           strip = Strip.new
  #           strip.strip_url = img_url
  #           strip.feed = feed
  #           strip.save

  #           break
  #         end
  #       end
  #     end
  #   end


############################# CTRL ALT DEL ################


  class CtrlFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))

      page_content.css("img").each do |img|
        img_url = img.attribute("src").value

        if /comics/ =~ img_url
          strip = Strip.new
          strip.strip_url = img_url
          strip.feed = feed
          strip.save

          break
        end
      end

    def get_old_strips(feed)
      #done by date in url
    end

    end
  end



end



