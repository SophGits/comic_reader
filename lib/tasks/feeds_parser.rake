require_relative "./comics_parser"

namespace :parsers do
  desc "run all parsers"

  task explosm: :environment do
    feed = Feed.where(feed_type: "explosm").first
    parser = ExplosmFeedParser.new


    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
      parser.get_old_strips(feed)
    end
  end

  desc "run Doghouse Diaries parser"
  task doghouse: :environment do
    feed = Feed.where(feed_type: "doghouse").first
    parser = DoghouseFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
    end
  end

  desc "run Xkcd parser"
  task xkcd: :environment do
    feed = Feed.where(feed_type: "xkcd").first
    parser = XkcdFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
      parser.get_old_strips(feed)
    end
  end

  desc "run Dinosaur Comics parser"
  task dinosaur: :environment do
    feed = Feed.where(feed_type: "dinosaur").first
    parser = DinosaurFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
      parser.get_old_strips(feed)
    end
  end

  desc "run CTRL+ALT+DEL parser"
  task ctrl: :environment do
    feed = Feed.where(feed_type: "ctrl").first
    parser = CtrlFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
    end
  end

  desc "run Perry Bible Fellowship Comics parser"
  task pbf: :environment do
    feed = Feed.where(feed_type: "pbf").first
    parser = PbfFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
    end
  end

  desc "run The Oatmeal parser"
  task oatmeal: :environment do
    feed = Feed.where(feed_type: "oatmeal").first
    parser = OatmealFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
    end
  end

  desc "run Dilbert Feed parser"
  task dilbert: :environment do
    feed = Feed.where(feed_type: "dilbert").first
    parser = DilbertFeedParser.new

    rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    rss_feed.entries.each do |entry|
      entry_url = entry.url
      parser.load_strip(entry_url, feed)
    end
  end

  desc "run Sarah Anderson Comics parser"
  task sarah: :environment do
    feed = Feed.where(feed_type: "sarah").first
    parser = SarahFeedParser.new

      entry_url = feed.feed_url
      parser.load_strip(entry_url, feed)
  end

  desc "run Twitter the Comic parser"
  task twitter: :environment do
    feed = Feed.where(feed_type: "twitter").first
    parser = TwitterFeedParser.new

      entry_url = feed.feed_url
      parser.load_strip(entry_url, feed)
  end

  desc "run Up and Out parser" #not working..or it will only get one image since there's only one on each page
  task upandout: :environment do
    feed = Feed.where(feed_type: "upandout").first
    parser = UpandoutFeedParser.new

      entry_url = feed.feed_url
      parser.load_strip(entry_url, feed)
      parser.get_old_strips(feed) #apparently wrong number of args
  end


end