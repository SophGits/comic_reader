entry_url = 1
feed = 2

namespace :parse do
  desc "Parses rss feed"

  task :load_explosm, :entry_url, :feed do |t, args|


  end


      # rss_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
      # rss_feed.entries.each do |entry|
      # entry_url = entry.url
      # load_strip(entry_url, feed)

  # task :invoke_explosm do
  #   Rake::Task[:load_explosm].invoke(entry_url, feed)
  # end

#        load_strip(entry_url, feed)
#         page_content = Nokogiri::HTML(open(:entry_url))

#         page_content.css("#maincontent div div img").each do |img|
#           img_url = img.attribute("src").value

#           if /Comics/ =~ img_url
#             strip = Strip.new
#             strip.strip_url = img_url
#             strip.feed = feed
#             strip.save

#             break
#           end
#         end

#   end
# end


# task :do_something :arg1, :arg2 do |t, args|
#   args.with_defaults(:arg1 => "default_arg1_value", :arg2 => "default_arg2_value")
#   # args[:arg1] and args[:arg2] contain the arg values, subject to the defaults
# end

# task :my_task, :arg1, :arg2 do |t, args|
#   puts "Args were: #{args}"
# end

# task :invoke_my_task do
#   Rake.application.invoke_task("my_task[1, 2]")
# end
# task :invoke_my_task_2 do
#   Rake::Task[:my_task].invoke(3, 4)
# end


end