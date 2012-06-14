# This installs (if required) and loads the mandatory libaries for this demo

# Required CRAN packages

package.list <- c("igraph", "network", "pixmap", "RCurl", "ReadImages", "rjson", "adimpro")

for (i in 1:length(package.list)) {
  pkg <- package.list[i]
  if(!IsInstalled(pkg)) {  
    install.packages(pkg)
  }
  require(pkg, character.only = TRUE)
}

# Required BiocLite packages

source("http://www.bioconductor.org/biocLite.R")

package.list <- c("Rgraphviz")

# To add Rgraphviz on CentOS linux requires:
#   yum inmstall graphviz
#   yum inmstall graphviz-devel
# To add Rgraphviz on Mac OS X requires:
#   http://www.graphviz.org/Download_macos.php
#   Note: Requires version 2.26.3 which is not available for all OS X platforms

for (i in 1:length(package.list)) {
  pkg <- package.list[i]
  if(!IsInstalled(pkg)) {  
    biocLite(pkg)
  }
  require(pkg, character.only = TRUE)
}

rm(i)
rm(package.list)
rm(pkg)