<!-- This file is edited in README.Rmd -->
`plot_it` function
==================

`R` version: 3.5.0

Overview
--------

Plotting function for switching between manuscript-ready and presentation style plots in `R`.

### Directions

:one: In your `R` file, run the following code.

``` r
require(RCurl)
script <- getURL("https://raw.githubusercontent.com/darwinanddavis/plot_it/master/plot_it.R", ssl.verifypeer = FALSE)
eval(parse(text = script))
```

:two: Use the following function to set your plotting parameters.

-   Specify if plotting for a manuscript or seminar (0/1)
-   Specify background colour (char)
-   Specify plotting colour palette 1 from RColorBrewer (char)
-   Specify plotting colour palette 2 from RColorBrewer (char)
-   Specify alpha transparency for plot points (int)
-   Specify font family for plot text (char)

``` r
require(RColorBrewer)
display.brewer.all()
# Set global plotting parameters
cat("plot_it( \n0 for presentation, 1 for manuscript, \nset colour for background, \nset colour palette 1. use 'display.brewer.all()', \nset colour palette 2. use 'display.brewer.all()', \nset alpha for colour transperancy, \nset font style \n)")

plot_it(0, "blue", "Spectral", "Greens", 1, "mono")  # set plot function params       
plot_it_gg("black", "white")  # specify background and foreground colours   
```

:three: Make cool graphs.

## Maintainer      
**Matt Malishev**       
:mag: [Website](https://www.researchgate.net/profile/Matt_Malishev)      
:bird: [@darwinanddavis](https://twitter.com/darwinanddavis)    
<p><a><img src="https://img.shields.io/twitter/follow/darwinanddavis.svg?label=Follow%20@darwinanddavis" alt="Follow @darwinanddavis"/></a></p>   
:email: matthew.malishev [at] gmail.com        

 
