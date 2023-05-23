# EG10118_Disneyland_Project
Throughout the spring semester of my first year, I developed an app in MATLAB's App Designer along with one other person (Jack Blake) in my Engineering Computing course.

### Given Instructions for the Project:
Working with a partner, you will develop an app through MATLAB that will be used to analyze a
set of data and obtain meaningful information (i.e., extracting information from the data). The
project will involve selecting a data set(s), processing the data to obtain the desired
information, and creating an interactive visualization of that information that can be controlled
by the user of the app.

### Chosen Data Set:
Our common love for themeparks made us choose a data set developed by Kwan Hui LIM, found at the following link:<p>
https://sites.google.com/site/limkwanhui/datacode<p>
**As described on his website:** "This dataset comprises a set of users and their visits to various attractions in five theme parks (Disneyland, Epcot, California Adventure, Disney Hollywood and Magic Kindgom). The user-attraction visits are determined based on geo-tagged Flickr photos that are: (i) posted from Aug 2007 to Aug 2017 and retrieved using the Flickr API; (ii) then mapped to specific attraction location and attraction categories; and (iii) then grouped into individual travel sequences (consecutive user-attraction visits that differ by <8hrs). Other associated datasets are the "List of Attractions/POIs" dataset ("POI-{themeParkName}.csv" files from "poiList-sigir17.zip") and "Attraction/POI Cost-Profit Table" dataset ("costProfCat-{themeParkName}POI-all.csv" files from "costProf-sigir17.zip")."
### The Process:
We chose to narrow down the scope of our data analysis to only focus on Disneyland in California, and made a slideshow deliverable outlining how we intended to design the app and how we would divide up the work so that it can be completed by the deadline. We wanted to answer 4 main questions:<p>
1. How does foot traffic in the park vary across months and years?
2. How has the busyness of individual attractions changed throughout time?
3. Which attractions do people prioritize on a trip to Disneyland and in what order?
4. How does the popularity of different attractions vary across months and years?<p>
Initial Deliverable Slideshow:<p>
 [Andrew Congdon, Jack Blake - Initial Project Deliverable.pdf](https://github.com/Gloworm72/EG10118_Disneyland_Project/files/11547786/Andrew.Congdon.Jack.Blake.-.Initial.Project.Deliverable.pdf)

*While we did split up the work, there was plenty of collaboration involved over the course of multiple weeks. Constant communication was needed to make sure we were both using the most up-to-date, cleaned data.*<p>
**My Role:**
* Create script to replace the attraction id’s with the names from the reference list
* Create script to convert unix time into dates/times
* Work on method of adding up number of visits for each attraction in a specific month and year
* Create script to make the heat map
* Work on method of adding up number of visits for each type of attraction in a specific month and year
* Create script to display types of attractions on pie graph<p>

**Jack's Role:**
* Create script to make a list of first attractions, second attractions, etc.
* Create code to make bar chart out of attractions order list
* Create script to separate data by attraction for Question 2
* Create code to turn script for Question 2 into a line graph
* Create script to remove duplicate data values (trip number and attraction name the same for back to back values)
### The Finished Product
Our final deliverable included all of the files needed to run the app, along with an oral presentation of our app, and a video demonstration:


https://github.com/Gloworm72/EG10118_Disneyland_Project/assets/105326899/007a20e0-b4f1-4c7d-a985-500c31bc3ae8


### Takeaways
* Disneyland did not have an even distribution of crowd levels
* Depending on the year and month, some attractions were busier than others
* People tend to prefer visiting some attractions first, others second, etc. Some attractions, however, remained relatively consistent in their order.<p>
**How we would change the app going forward:**
The dataset may have been scewed by the popularity of the app, Flickr, which was used to collect the data. So, if given the opportunity to iterate on our app design, we would standardize the dataset so as not to be influenced by Flickr's popularity.
### Lessons Learned
* The importance of cleaning data
* Different ways to represent data in MATLAB (heat maps, bar graphs, pie charts, etc.)
* How to effectively work under a tight timeline
* The importance of peer feedback to our work
 
