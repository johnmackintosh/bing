# bing
a short introduction to the workings of {targets} 



## What's this all about?

You are going to learn how to use the {targets} package.   
You'll do this by running, and optionally, amending, some functions.   
These functions have already been created for you as a starting point.   

## What's in the project?

`/img` -  folder contains 5 images of a character from the TV sitcom Friends.  
You probably can't guess who it is. Resist the urge to look at them, or you risk removing what little comedic value exists.  

`/R` - contains one file with a few `R` functions which 
 - read in the images  
 - adds captions  
 - creates a  new combined image  
 - saves it to disk 

`vowels.csv` - a simple text file list the vowels in the English alphabet

`_targets.R` - creates the links between the functions and the inputs and outputs

`run.R` - uses targets to create a list of functions and inputs, in the correct order. It also creates a plot of these dependencies, and will create the final image. When run successfully, it will also create a folder named `_targets`, which will contain information to track the current status of the project


