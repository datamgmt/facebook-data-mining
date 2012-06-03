# Facebook - hacking the social network

# Step 1: Get a Facebook Graph API Explorer Access Token
# Go to 'https://developers.facebook.com/tools/explorer', login and click "Get access token"
# Store your access token here:
cat("Step 1: Get a Facebook Graph API Explorer Access Token","\n")
source("AccessToken.R")

# Step 2: Add the userid of the individual whose social network you want to examine
# By default this is "me" but otherwise it should be an individuals facebook id
cat("Step 2: Add the userid of the individual whose social network you want to examine","\n")
individual.id <- "29092950651"

# Step 3: Fetch data about the selected individual
cat("Step 3: Fetch data about the selected individual","\n")
source("Individual.R")

# Step 4: Show data about posts
cat("Step 4: Show data about posts","\n")
source("Posts.R")