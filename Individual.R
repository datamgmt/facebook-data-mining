# Fetch data about the selected individual

individual <- FacebookFetch(access.path=paste(individual.id),access.token=access.token )
if (length(individual$id)) {
  cat ("Working with individual: ",individual$name," (",individual$id,")\n", sep="")
} else{
  cat("Message: ", unlist(individual)[1], "\n")
  cat("Type:    ", unlist(individual)[2], "\n")
  cat("Code:    ", unlist(individual)[3], "\n")
  stop("   Cannot continue")
}

# Fetch an individuals photos
individual.photos <- FacebookFetch(access.path=paste(individual.id,"photos", sep="/"),access.token=access.token )

# Fetch the url of the indiviiduals photos
if (!is.null(individual.photos$data)) {
individual.photos.url <- sapply( individual.photos$data, function(x){
  url <- x$source
  url <- gsub("https","http",url)
})

# Create the location to store the individuals photos locally
individual.photos.file <- paste("photos",individual.id,basename(individual.photos.url), sep="/")
}

# Get the individuals posts
individual.posts <- list()

i <- 0
next.path <- paste(individual.id,"posts", sep="/")
while(length(next.path)!=0) {
  i<-i+1
  individual.posts[[i]] <- FacebookFetch(access.path=next.path , access.token=access.token)
  next.path <- sub("https://graph.facebook.com/", "", individual.posts[[i]]$paging$'next')
}

individual.posts[[i]] <- NULL

# Parse the list, extract number of likes and the corresponding text (status)

# Get the text of the message
individual.posts.messages <- unlist(sapply(individual.posts, ParsePosts, f=ParsePostMessages))

# Get the count of the likes
individual.posts.likes <- unlist(sapply(individual.posts, ParsePosts, f=ParsePostLikes))

# Get a count of the comments
individual.posts.comments <- unlist(sapply(individual.posts, ParsePosts, f=ParsePostComments))

# Get the individuals posted links
individual.links <- unlist(sapply(individual.posts, ParsePosts, f=ParsePostLinks))

# Get the number of likes for any given link
individual.links.likes <- unlist(sapply(individual.posts, ParsePosts, f=ParsePostLinkLikes))

# Display the three most popular links
cat("Displaying the three most popular links by this individual:\n")
cat(individual.links[order(individual.links.likes,decreasing=TRUE)][1:3])

rm(i)
rm(next.path)