# Step 1: Run the requirements script
# This installs (if required) and loads the mandatory libaries 
cat("Step 1: Run the requirements script","\n")
source("Requirements.R")

# Step 2: Create functions used by the demo
# This creates the 'facebook' function as described at
# http://romainfrancois.blog.free.fr/index.php?post/2012/01/15/Crawling-facebook-with-R
# and other functions to create initials, etc.
cat("Step 2: Create functions used by the demo","\n")
source("Functions.R")