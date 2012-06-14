friends.location.id <- character(0)
friends.location.name <- character(0)
friends.location.longitude <- character(0)
friends.location.latitude <- character(0)

for (i in 1:length(friends.id)) {
  temp.friend.data <- FacebookFetch(access.path = paste(friends.id[i], 
    sep = "/"), access.token = access.token)
  if (!is.null(temp.friend.data$location$id)) {
    friends.location.id[i] <- temp.friend.data$location$id
    if (!is.null(temp.friend.data$location$name)) {
      friends.location.name[i] <- temp.friend.data$location$name
    }
    temp.location.data <- FacebookFetch(access.path = paste(friends.location.id[i], 
      sep = "/"), access.token = access.token)
    if (!is.null(temp.location.data$location$longitude) & 
      !is.null(temp.location.data$location$latitude)) {
      friends.location.longitude[i] <- temp.location.data$location$longitude
      friends.location.latitude[i] <- temp.location.data$location$latitude
    }
  }
}


sink("output/FriendsLocation.kml")
cat('<?xml version="1.0" encoding="UTF-8"?>\n', sep="")
cat('<kml xmlns="http://earth.google.com/kml/2.2">\n', sep="")
cat('  <Document>\n', sep="") 
cat('  <name>Facebook Friends Locations</name>\n', sep="") 
cat('  <description>Map of how my Facebook Friends are geographically related</description>\n', sep="")
cat('  <Style id="style1">\n', sep="")
cat('    <LineStyle>\n', sep="")
cat('    <color>73FF0000</color>\n', sep="")
cat('    <width>5</width>\n', sep="")
cat('    </LineStyle>\n', sep="")
cat('  </Style>\n', sep="")

cat('  <Folder>\n', sep="") 
cat('  <name>Individuals</name>\n', sep="") 
for (i in 1:length(friends.id)) {
  if ( !is.na(friends.location.longitude[i]) ){
    cat('  <Placemark>\n', sep="")  
    cat('    <name>',friends.initial[i],'</name>\n', sep="")  
    cat('    <description>',friends.name[i],'</description>\n', sep="") 
    cat('    <Point>\n', sep="")
    cat('      <coordinates>',friends.location.longitude[i],',',friends.location.latitude[i],',0','</coordinates>\n', sep="") 
    cat('    </Point>\n', sep="")
    cat('  </Placemark>\n', sep="")  
  }
}
cat('  </Folder>\n', sep="") 

cat('  <Folder>\n', sep="") 
cat('  <name>Relationships between Individuals</name>\n', sep="") 
for (i in 1:length(friends.id))  {
  for (j in 1:length(friends.id)) {
    if (friends.matrix[i,j] > 0) {
      if ( !is.na(friends.location.longitude[i]) & !is.na(friends.location.longitude[j]) ) {
        cat('  <Placemark>\n', sep="")  
        cat('    <name>',friends.initial[i],'/',friends.initial[j],'</name>\n', sep="")  
        cat('    <description>',friends.name[i],'/',friends.name[j],'</description>\n', sep="") 
        cat('    <styleUrl>#style1</styleUrl>\n', sep="") 
        cat('    <LineString>\n', sep="") 
        cat('       <tessellate>1</tessellate>\n', sep="") 
        cat('       <altitudeMode>clampToGround</altitudeMode>\n', sep="") 
        cat('       <coordinates>\n', sep="") 
        cat('       ',friends.location.longitude[i],',',friends.location.latitude[i],',0.0','\n', sep="") 
        cat('       ',friends.location.longitude[j],',',friends.location.latitude[j],',0.0','\n', sep="") 
        cat('       </coordinates>\n', sep="") 
        cat('     </LineString>\n', sep="") 
        cat('  </Placemark>\n', sep="")         
      } 
    }
  }
}
cat('  </Folder>\n', sep="") 

cat('  </Document>\n', sep="")  
cat('</kml>\n', sep="")  

sink()
