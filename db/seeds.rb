User.destroy_all
Message.destroy_all
Comment.destroy_all
Feed.destroy_all
Subscription.destroy_all
Strip.destroy_all

bob = User.create(username: "Bob", email: "bob@bob.com", role: "admin", password: "password", created_at: DateTime.now, avatar="http://andromeda.star.bris.ac.uk/~mbt/treeview/icons/TREE_LOGO.gif")
