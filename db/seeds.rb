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

cyanide = Feed.create(title: "Cyanide and Happiness, yo", logo: "a", main_url: "b", feed_url: "http://feeds.feedburner.com/Explosm", keywords: "d", summary: "e", author: "f", flag_count: 0, up_vote_count: 5, down_vote_count: 1, created_at: DateTime.now)
cyanide.save!
