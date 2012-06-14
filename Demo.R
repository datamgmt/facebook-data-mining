# Facebook - hacking the social network

# Step 1: Get a Facebook Graph API Explorer Access Token
# Go to 'https://developers.facebook.com/tools/explorer', login and click "Get access token"
# Store your access token here:
cat("Step 1: Get a Facebook Graph API Explorer Access Token","\n")
source("AccessToken.R")

# Step 2: Add the userid of the individual whose social network you want to examine
# By default this is "me" but otherwise it should be an individuals facebook id
cat("Step 2: Add the userid of the individual whose social network you want to examine","\n")
individual.id <- "me"
file.seqno <- 1

# Step 3: Fetch data about the selected individual
cat("Step 3: Fetch data about the selected individual","\n")
source("Individual.R")

# Step 4: Fetch data about the individuals friends
cat("Step 4: Fetch data about the individuals friends","\n")
source("Friends.R")

# Step 5: Fetch the individuals and the friends photos
cat("Step 5: Fetch the individuals and the friends photos","\n")
source("Photos.R")

# Step 6: Generate Social Network Maps
cat("Step 6: Generate Social Network Maps","\n")
source("Network.R")

# Step 7: Show data about posts
cat("Step 7: Show data about posts","\n")
source("Posts.R")

# Step 8: Show Exif Data from individuals photos
cat("Step 8: Show Exif Data from individuals photos","\n")
source("ExifData.R")
