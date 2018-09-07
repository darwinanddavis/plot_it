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

script <- getURL("https://raw.githubusercontent.com/opetchey/RREEBES/Beninca_development/Beninca_etal_2008_Nature/report/functions/indirect_method_functions.R", ssl.verifypeer = FALSE)

eval(parse(text = script))
```  

:two: Use the following function to set your plotting parameters.  

```{r}
# Set global plotting parameters
message("plot_it = 1/0, set colour, set colour palette 'display.brewer.all()',set alpha for col,set font")
plot_it(0,"blue","Spectral",1,"mono") # set col function params
plot_it_gg("white") # same as above
```  

:three: Make cool graphs.  
