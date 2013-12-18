module ParserHelper

  class FeedParser
    def record_notifications subscriptions, feed, strip
      subscriptions.each do |subscription|
        subscribed_user = subscription.user
      # for each user, we create a record in notification table, with the strip id and the user id and active -> true

        new_notification = Notification.new
        new_notification.user = subscribed_user
        new_notification.strip = strip
        new_notification.feed = feed
        new_notification.save
      end
    end
  end

######################### EXPLOSM ####################################
  class ExplosmFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css("#maincontent div div img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

        if /Comics/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save

          #find all users who subscribed to this feed
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
    # ARCHIVED EXPLOSM -- CHANGE NUMBERS FOR MORE (BUT WILL TAKE FOREVER TO PROCESS) ###
    def get_old_strips(feed)
      (3000..3020).each do |index|
        entry_url = "http://www.explosm.net/comics/" + index.to_s
        load_strip(entry_url, feed)
      end
    end

  end
############################# DOUGHOUSE DIARIES #################
  class DoghouseFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css(".object img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

          if /comics/ =~ img_url && !old_strip
            strip = feed.strips.new
            strip.strip_url = img_url
            strip.save
            record_notifications feed.subscriptions, feed, strip
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
############################# XKCD #############################
  class XkcdFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css("#comic img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

        if /comics/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
    ######## ALTER NUMBERS WHEN LAUNCH ########################
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
        old_strip = feed.strips.where(strip_url: img_url).first

        if /comics/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
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
############################# CTRL ALT DEL ################
  class CtrlFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css("img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

        if /comics/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
    def get_old_strips(feed)
      #done by date in url
    end
  end
######################### DILBERT ####################################
  class DilbertFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css("img").each do |img|
        img_url = img.attribute("src").value
        img_url = "http://dilbert.com/" + img_url
        old_strip = feed.strips.where(strip_url: img_url).first

        if /zoom.gif/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
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

#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205537/205537.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205538/205538.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205539/205539.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205540/205540.strip.zoom.gif
#   http://dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/5000/500/205541/205541.strip.zoom.gif


############################# PBF COMICS ################
  class PbfFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css("#topimg").each do |img|
        img_url = img.attribute("src").value
        img_url = "http://pbfcomics.com" + img_url
        old_strip = feed.strips.where(strip_url: img_url).first

        if /archive_b/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
    ######## DOESN'T WORK YET ########################
    # def get_old_strips(feed)
    #   (1..259).each do |index|
    #     entry_url = "http://pbfcomics.com/" + index.to_s
    #     load_strip(entry_url, feed)
    #   end
    # end
  end
######################### OATMEAL ####################################
  class OatmealFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css(".panel img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

        if /comics/ =~ img_url && !old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
    ##### NOT SURE HOW TO OBTAIN ARCHIVED OATMEAL #######
    def get_old_strips(feed)
      #
    end
  end
######################### UP AND OUT #################################### NOT WORKING
  class UpandoutFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css(".photo img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

        if img_url != old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
    ##### PAGES OF TUMBLR BLOG #######
    def get_old_strips(feed)
        (1..159).each do |index|
        entry_url = "http://jeremykaye.tumblr.com/page/" + index.to_s
        load_strip(entry_url, feed)
      end
    end
  end
######################### SARAH ANDERSON ####################################
  class SarahFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css(".post img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

        if img_url != old_strip
          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
        end
      end
    end
  end
######################### TWITTER  THE COMIC ####################################
  class TwitterFeedParser < FeedParser
    def load_strip(entry_url, feed)
      page_content = Nokogiri::HTML(open(entry_url))
      page_content.css(".content img").each do |img|
        img_url = img.attribute("src").value
        old_strip = feed.strips.where(strip_url: img_url).first

          strip = feed.strips.new
          strip.strip_url = img_url
          strip.save
          record_notifications feed.subscriptions, feed, strip
      end
    end
  end

######################### SLIM FIGURES #################################### pretty sure these last two once worked
  # class SlimFeedParser < FeedParser
  #   def get_old_strips(feed)
  #     (1..300).each do |index|
  #       entry_url = "http://www.slimfigures.co.uk/archive/comic" + index.to_s + ".php"
  #       load_strip(feed, entry_url)
  #     end
  #   end

  #   def load_strip(feed, entry_url)
  #     page_content = Nokogiri::HTML(open(entry_url))

  #     page_content.css("img").each do |img|
  #       img_url = img.attribute("src").value

  #         strip = Strip.new
  #         strip.strip_url = img_url
  #         strip.feed = feed
  #         strip.save
  #       end
  #     end
  # end

######################### YOU'RE ALL JUST JEALOUS OF MY JETPACK #################################
  # class JetFeedParser < FeedParser
  #   def load_strip(feed)
  #     page_content = Nokogiri::HTML(open(feed.feed_url))

  #     page_content.css("article div img").each do |img|
  #       img_url = img.attribute("src").value

  #         strip = Strip.new
  #         strip.strip_url = img_url
  #         strip.feed = feed
  #         strip.save

  #     end
  #   end
  # end


############################# SIMON'S CAT ################ NOT WORKING ####
  # class CatFeedParser < FeedParser
  #   def load_strip(feed)
  #     page_content = Nokogiri::HTML(open(feed.feed_url))

  #     page_content.css("article img").each do |img|
  #       img_url = img.attribute("src").value

  #         strip = Strip.new
  #         strip.strip_url = img_url
  #         strip.feed = feed
  #         strip.save

  #       end
  #     end

  #   def get_old_strips(feed)
  #     #
  #   end

  #   end
############################# HARK! A VAGRANT ################ NOT WORKING

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

######################### GET STRIPS (should be ANY TYPE) ######################

    # def get_strips(feed)

    #   if feed.feed_type == "cat"
    #     load_strip(feed)
    #   elsif feed.feed_type == "sarah"
    #     load_strip(feed)
    #   elsif feed.feed_type == "twitter"
    #     load_strip(feed)
    #   elsif feed.feed_type == "upandout"
    #     load_strip(feed)
    #   # elsif feed.feed_type == "vagrant"
    #   #   preload_strip(feed)
    #   # elsif feed.feed_type == "slim"
    #   #   get_old_strips(feed)
    #   else
    #     rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    #     rss_feed.entries.each do |entry|
    #     entry_url = entry.url
    #     load_strip(entry_url, feed)
    #     end
    #   end
    # end

end