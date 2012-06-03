# Display the most liked and the most commented messages

cat("Most Liked post: ", individual.posts.messages[which.max(individual.posts.likes)], 
  " (", individual.posts.likes[which.max(individual.posts.likes)], 
  ")\n", sep = "")
cat("Most Commented post: ", individual.posts.messages[which.max(individual.posts.comments)], 
  " (", individual.posts.comments[which.max(individual.posts.comments)], 
  ")\n", sep = "")
