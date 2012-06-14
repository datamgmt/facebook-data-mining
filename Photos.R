# Create a "photos" directory (Warnings ignored so if it already exists it will safely continue)

# Create a "photos" directory
dir.create( "photos", showWarnings = FALSE )

# Create a directory for the individual's photos
dir.create( paste("photos",individual.id, sep="/"), showWarnings = FALSE )

# Download each of the individuals photos
for (i in 1:length(individual.photos.url)) {
  download.file(individual.photos.url[i], individual.photos.file[i])
}

# Create a directory for the friends photos
dir.create( paste("photos","friends", sep="/"), showWarnings = FALSE )

# Download each friends photos
for (i in 1:length(friends.photos.url)) {
  download.file(friends.photos.url[i], friends.photos.file[i])
}

# Nasty hack to call CentOS 'convert' command for when people have uploaded non-jpg files
system('for i in `ls photos/*/*.jpg`; do j=${i%.*}; convert $j.jpg $j.jpg; done', wait=TRUE)

# Cleanup temporary variables
rm(i)
