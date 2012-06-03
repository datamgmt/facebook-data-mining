Facebook Data Mining in R

Introduction

This group of scripts was inspired by a series of posts on how to data mine Facebook data. The scripts allow you to connect to the Facebook graph API and download data associated with an individual, their posts, friends, etc. and then analyse and graaph these in various ways.

About The Script

The scripts are broken up into a number of groups as follows:

 * Setup.R - Sets up the environment required
 * Demo.R - A demonstration of personal data
 * DemoGeorgeTakei.R - A demonstration of data available from Star Trek actor and activist George Takei (Sulu)
 * DemoTED.R - A demonstration of data available from TED.com's video posts

All the other scripts called from these four scripts

Getting Started

 * First you need an access token. To do this you need to visit https://developers.facebook.com/tools/explorer', 
   login and click "Get access token" and then paste this into the appropriate place in AccessToken.R

 * Next from within R (or RStudio - http://rstudio.org, my personal preferred method) run the following command:

   source("Setup.R")

	This will ensure that all the required packages from the demo and installed and loaded (by calling Requirements.R)
	and that all the shared functions that are required are created (by calling Functions.R) 
	
The Demos

At the three demos listed above can be called with:

	source("Demo.R")
	source("DemoGeorgeTakei.R")
	source("DemoTED.R")
	
Each of these will call some of the following functions:

	AccessToken.R - Gives access to the API - called by all scripts
	Individual.R - Gets data associated with the individual - called by all scripts
	Friends.R - Gets data associated with an individuals friends - called by Demo.R
	Photos.R - Gets photographs associated with an individual and their friends - called by Demo.R
	Network.R - Plots the social network of a group of friends in various formats/methods - called by Demo.R
	Posts.R - Gets various pieces of information about posts made by an individual - called by all scripts


List of source URLs used in the development of these scripts

http://romainfrancois.blog.free.fr/index.php?post/2012/01/15/Crawling-facebook-with-R
http://blog.revolutionanalytics.com/2012/01/visualize-your-facebook-friends-network-with-r.html
http://applyr.blogspot.co.uk/2012/01/mining-facebook-data-most-liked-status.html?spref=tw
https://github.com/sciruela/facebookFriends
http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html