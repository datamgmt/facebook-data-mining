# This module fetches the friend data

# Get the list of friends
friends <- FacebookFetch(access.path=paste(individual.id,"friends", sep="/"), access.token=access.token)
# Pre-1986 Group
friends <- FacebookFetch(access.path=paste("10150846364521714","members", sep="/"), access.token=access.token)
# Sequent Group
friends <- FacebookFetch(access.path=paste("10150846271306714","members", sep="/"), access.token=access.token)

# Extract the friends Facebook IDs
friends.id <- sapply(friends$data, function(x) x$id)

# Extract the friends Facebook names 
friends.name <- sapply(friends$data, function(x) iconv(x$name,"UTF-8","ASCII//TRANSLIT"))

# Create a list of friends initials 
friends.initial <- sapply(strsplit(friends.name, " "), GetInitials)

# Count the number of friends
friends.count <- length(friends.id)

# Create a list of each friends profile photo url
friends.photos.url <- paste("http://graph.facebook.com", friends.id, "picture", sep="/")

# Create a list of each friends profile photo file after downloading
friends.photos.file <- paste(paste("photos","friends",friends.id, sep="/"),"jpg", sep=".")

# Generate the friendship matrix

# This is square matrix of friends.count by friends.count

# Create the initial matrix, populating each with a value of zero to represent not a mutual friend
friends.matrix <- matrix(0,friends.count,friends.count)

# Then for each friend
for (i in 1:friends.count) {
  # Get the mutualfriends data
	mutualfriends <- FacebookFetch(access.path=paste(individual.id,"mutualfriends", friends.id[i], sep="/"), access.token=access.token)
	# Extract the mutualfriends id
	mutualfriends.id <- sapply(mutualfriends$data, function(x) x$id)
	# Update each intersection in the matrix of a friend/mutualfriend with a value of one to represent a mutual friend
	friends.matrix[i,friends.id %in% mutualfriends.id] <- 1
}

# Cleanup temporary variables
rm(i)
rm(mutualfriends)
rm(mutualfriends.id)
