# Differenent representations of the social network

# Type 1: Using the 'network' library 

# Friends (using their initials)
friends.network <- as.network(friends.matrix)
plot(friends.network, label=friends.initial, arrowhead.cex=0)

# And writing to a PDF
pdf(file=paste("output/Network_Initials_",file.seqno,".pdf", sep=""), width=25, height=25)
plot(friends.network, label=friends.initial, arrowhead.cex=0)
dev.off()
file.seqno <- file.seqno + 1

# Friends (using their full names)
friends.network <- as.network(friends.matrix)
plot(friends.network, label=friends.name, arrowhead.cex=0)

# And writing to a PDF
pdf(file=paste("output/Network_Names_",file.seqno,".pdf", sep=""), width=25, height=25)
plot(friends.network, label=friends.name, arrowhead.cex=0)
dev.off()
file.seqno <- file.seqno + 1

# Type 2: Using the 'Rgraphviz' library

# Initial set up for the graph

# Create the graph
friends.graph <-graph.adjacency(friends.matrix,mode="undirected")
# Create a fixed layout
set.seed(1)
friends.layout <- layout.fruchterman.reingold(friends.graph)
# Rescale the layout to -1 to 1
friends.layout[,1]=(friends.layout[,1]-min(friends.layout[,1]))/(max(friends.layout[,1])-min(friends.layout[,1]))*2-1
friends.layout[,2]=(friends.layout[,2]-min(friends.layout[,2]))/(max(friends.layout[,2])-min(friends.layout[,2]))*2-1

# Friends (using their initials)
V(friends.graph)$label <- friends.initial
plot(friends.graph,layout=friends.layout,vertex.size=0,vertex.frame.color="#00000000")

# And writing to a PDF
pdf(file=paste("output/Network_Initials_",file.seqno,".pdf", sep=""), width=25, height=25)
plot(friends.graph,layout=friends.layout,vertex.size=0,vertex.frame.color="#00000000")
dev.off()
file.seqno <- file.seqno + 1

# Friends (using their names)
V(friends.graph)$label <- friends.name
plot(friends.graph,layout=friends.layout,vertex.size=0,vertex.frame.color="#00000000")

# And writing to a PDF
pdf(file=paste("output/Network_Names_",file.seqno,".pdf", sep=""), width=25, height=25)
plot(friends.graph,layout=friends.layout,vertex.size=0,vertex.frame.color="#00000000")
dev.off()
file.seqno <- file.seqno + 1

# Currently commented out until I can improve the speed and output size
#
# # Friends (using their photos)
# V(friends.graph)$label <- ""
# plot(friends.graph,layout=friends.layout,vertex.size=0,vertex.frame.color="#00000000")
# 
# # Additional code required to add image
# friends.layout.tmp<-friends.layout
# for(i in length(friends.id):1){			  
#  	myfriend.photo<-read.jpeg(paste("photos/friends/",friends.id[i],".jpg",sep=""))
# 	if(i!=1){
# 	  apply(friends.layout.tmp,1,function(x)rasterImage(myfriend.photo,x[1]-0.05,x[2]-0.05,x[1]+0.05,x[2]+0.05))
#     friends.layout.tmp<-friends.layout.tmp[-i,]
# 	}else{
# 		rasterImage(myfriend.photo,friends.layout.tmp[1]-0.05,friends.layout.tmp[2]-0.05,friends.layout.tmp[1]+0.05,friends.layout.tmp[2]+0.05)
# 	}
# }
# 
# # And writing to a PDF
# pdf(file=paste("output/Network_Photos_",file.seqno,".pdf", sep=""), width=25, height=25)
# plot(friends.graph,layout=friends.layout,vertex.size=0,vertex.frame.color="#00000000")
# friends.layout.tmp<-friends.layout
# for(i in length(friends.id):1){			  
#  	myfriend.photo<-read.jpeg(paste("photos/friends/",friends.id[i],".jpg",sep=""))
# 	if(i!=1){
# 	  apply(friends.layout.tmp,1,function(x)rasterImage(myfriend.photo,x[1]-0.05,x[2]-0.05,x[1]+0.05,x[2]+0.05))
#     friends.layout.tmp<-friends.layout.tmp[-i,]
# 	}else{
# 		rasterImage(myfriend.photo,friends.layout.tmp[1]-0.05,friends.layout.tmp[2]-0.05,friends.layout.tmp[1]+0.05,friends.layout.tmp[2]+0.05)
# 	}
# }
# dev.off()
# file.seqno <- file.seqno + 1


