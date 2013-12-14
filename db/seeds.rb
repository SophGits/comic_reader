User.destroy_all
Message.destroy_all
Comment.destroy_all
Feed.destroy_all
Subscription.destroy_all
Strip.destroy_all

bob = User.create(username: "Bob", email: "bob@bob.com", role: "admin", password: "password", created_at: DateTime.now, avatar: "http://andromeda.star.bris.ac.uk/~mbt/treeview/icons/TREE_LOGO.gif")
bob.save!

shaniqua = User.create(username: "shaniqua", email: "shaniqua@shaniqua.com", role: "user", password: "password", created_at: DateTime.now, avatar:"")
shaniqua.save!

rita = User.create(username: "Rita", email: "rita@rita.com", role: "user", password: "password", created_at: DateTime.now, avatar:"")
rita.save!

#Bob messages Shaniqua
message1 = Message.create(sender_id: bob.id, recipient_id: shaniqua.id, content: "Hello Shaniqua, from Bob", is_read: true)
# Shaniqua messages Bob
message2 = Message.create(sender_id: shaniqua.id, recipient_id: bob.id, content: "Hey, Bob! Great to hear from you.", is_read: false)
message2 = Message.create(sender_id: shaniqua.id, recipient_id: bob.id, content: "Hey, Bob! This is my second message to you.", is_read: false)
#Rita messages Bob
message2 = Message.create(sender_id: rita.id, recipient_id: bob.id, content: "Hi Bob - from Rita.", is_read: false)

cyanide = Feed.create(title: "Cyanide and Happiness, yo", logo: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash1/s48x48/276807_67400590475_706984281_q.jpg", main_url: "b", feed_url: "http://feeds.feedburner.com/Explosm", keywords: "d", summary: "e", author: "f", flag_count: 0, up_vote_count: 5, down_vote_count: 1, feed_type: "explosm")
cyanide.save!

ExplosmFeedParser.new.get_old_strips(cyanide)

# comment1 = cyanide_strip.comments.create(content: "Hey, I love this one!", flag_count: 0, up_vote_count: 2, down_vote_count: 1, user_id: bob.id)
# comment1.save!

dilbert = Feed.create(title: "Dilbert, yo", logo: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash1/373035_163128967074041_832978965_q.jpg", main_url: "http://www.dilbert.com", feed_url: "http://feed.dilbert.com/dilbert/daily_strip", keywords: "dilbert, dogbert etc", summary: "You know: Dilbert...", author: "Scott Adams", flag_count: 0, up_vote_count: 15, down_vote_count: 1, feed_type: "dilbert")
dilbert.save!

DilbertFeedParser.new.get_old_strips(dilbert)

# dilbert_strip = Strip.create(strip_url: "http://www.dilbert.com/dyn/str_strip/000000000/00000000/0000000/200000/00000/6000/400/206400/206400.strip.gif", keywords: "Dilbert, Dogbert, the cat from HR etc", up_vote_count: 5, down_vote_count: 0, feed_id: dilbert.id)
# dilbert_strip.save!

# comment2 = dilbert_strip.comments.create(content: "Hey! Everybody loves Dogbert, right?!", flag_count: 0, up_vote_count: 2, down_vote_count: 1, user_id: shaniqua.id)
# comment1.save!

doghouse = Feed.create(title: "Doghouse Diaries", logo: "", main_url: "", feed_url: "http://feeds2.feedburner.com/thedoghousediaries/feed", keywords: "doghouse diaries", summary: "stick people", author: "an author", feed_type: "doghouse")
doghouse.save!

# DoghouseFeedParser.new.get_old_strips(doghouse)

xkcd = Feed.create(title: "XKCD", logo: "", main_url: "", feed_url: "http://xkcd.com/rss.xml", keywords: "science, maths, programming", summary: "", author: "", feed_type: "xkcd")
xkcd.save!

XkcdFeedParser.new.get_old_strips(xkcd)

dinosaur = Feed.create(title: "Dinosaur Comics", logo: "", main_url: "", feed_url: "http://www.rsspect.com/rss/qwantz.xml", keywords: "dinosaurs, mostly.", summary: "", author: "", feed_type: "dinosaur")
dinosaur.save!

DinosaurFeedParser.new.get_old_strips(dinosaur)

# vagrant = Feed.create(title: "Hark! A vagrant!", logo: "", main_url: "", feed_url: "http://www.harkavagrant.com/archive.php", keywords: "vagrants", summary: "", author: "", feed_type: "vagrant")
# vagrant.save!

ctrl = Feed.create(title: "CTRL ALT DEL", logo: "", main_url: "", feed_url: "http://cdn.cad-comic.com/rss.xml", keywords: "It's CTRL_ALT_DEL, in't it....", summary: "", author: "", feed_type: "ctrl")
ctrl.save!

cat = Feed.create(title: "Simon's Cat", logo: "", main_url: "", feed_url: "http://cdn.cad-comic.com/rss.xml", keywords: "blah blah blah", summary: "", author: "Simon Tofield", feed_type: "cat")
cat.save!

pbf = Feed.create(title: "Perry Bible Fellowship", logo: "", main_url: "", feed_url: "http://pbfcomics.com/feed/feed.xml", keywords: "blah blah blah", summary: "", author: "", feed_type: "pbf")
pbf.save!

# PbfFeedParser.new.get_old_strips(pbf)

oatmeal = Feed.create(title: "The Oatmeal", logo: "", main_url: "", feed_url: "http://feeds.feedburner.com/oatmealfeed", keywords: "blah blah blah", summary: "", author: "", feed_type: "oatmeal")
oatmeal.save!
