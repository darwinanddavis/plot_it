# `plot_it` function  
### Matthew Malishev<sup>1*</sup>  
#### _<sup>1</sup> Department of Biology, Emory University, 1510 Clifton Road NE, Atlanta, GA, USA, 30322_  

##### *Corresponding author: matthew.malishev@gmail.com    

doi: [DOI](https://github.com/darwinanddavis/plot_it)  
:link: [Github](https://github.com/darwinanddavis/plot_it)    

****** 

Files:  
.R       

## Overview
Plotting function for switching between manuscript-ready and presentation style plots in `R`.  

### Directions
:one: In your `R` file, run the following code.  

```{r}
require(RCurl)
script <- getURL("https://github.com/darwinanddavis/plot_it/raw/master/plot_it.R", ssl.verifypeer = FALSE)
eval(parse(text = script))
```  

:two: Use the following function to set your plotting parameters.  

```{r}
require(RColorBrewer)
# Set global plotting parameters
cat("plot_it( \n0 for presentation, 1 for manuscript, \nset colour for background, \nset colour palette. use 'display.brewer.all()', \nset alpha for colour transperancy, \nset font style \n)")
plot_it(0,"blue","Spectral",1,"mono") # set col function params
plot_it_gg("white") # same as above
```  

:three: Make cool graphs.  
