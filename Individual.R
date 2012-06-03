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

rm(i)
rm(next.path)

# Parse the list, extract number of likes and the corresponding text (status)
parse.master <- function(x, f) sapply(x$data, f)

# Get the text of the message
parse.messages <- function(x) if(!is.null(x$message)) x$message else NA
individual.posts.messages <- unlist(sapply(individual.posts, parse.master, f=parse.messages))

# Get the count of the likes
parse.likes <- function(x) if(!is.null(x$likes$count)) x$likes$count else 0
individual.posts.likes <- unlist(sapply(individual.posts, parse.master, f=parse.likes))

# Get a count of the comments
parse.comments <- function(x) if(!is.null(x$comments$count)) x$comments$count else 0
individual.posts.comments <- unlist(sapply(individual.posts, parse.master, f=parse.comments))

parse.links <- function(x) if (x$type=="link" & x$from$id==individual.id) x$link else NA
individual.links <- unlist(sapply(individual.posts, parse.master, f=parse.links))

parse.links.likes <- function(x) if (x$type=="link" & x$from$id==individual.id) x$likes$count else NA
individual.links.likes <- unlist(sapply(individual.posts, parse.master, f=parse.links.likes))

# see three most popular talks
individual.links[order(individual.links.likes,decreasing=TRUE)][1:3]