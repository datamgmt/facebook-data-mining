# This creates the 'facebook' function as described at
# http://romainfrancois.blog.free.fr/index.php?post/2012/01/15/Crawling-facebook-with-R
# and functions to create initials, etc.

# Define the facebook function 

FacebookFetch <- function(access.path = "me", access.token, access.options) {
  if (missing(access.options)) {
    access.options <- ""
  }
  else {
    access.options <- sprintf("?%s", paste(names(access.options), "=", 
      unlist(access.options), collapse = "&", sep = ""))
  }
  data <- getURL(sprintf("https://graph.facebook.com/%s%s&access.token=%s", 
    access.path, access.options, access.token))
  fromJSON(data)
}

# Define a function to convert a space seperated list into a set of initials 
# e.g. "David Walker" will become "DW"

GetInitials <- function(x) paste(substr(x, 1, 1), collapse = "")

# Define a function to check a package is installed

IsInstalled <- function(mypkg) is.element(mypkg, installed.packages()[,1]) 