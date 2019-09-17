### set plotting params   
plot_it <- function(manuscript,bg,cp1,cp2,alpha,family){ # plotting function (plot for MS or not, set bg color, set color palettes 1 and 2 from RColorBrewer, set alpha value for transperancy, set font style) 
  require(sp)
  require(ggplot2)
  require(ggthemes)
  require(RColorBrewer)
  graphics.off()
  if(manuscript==0){
    if(bg=="black"){
      colvec <<- magma(200,1) # plot window bg # USES <<- OPERATOR
      par(bg = colvec[1],col.axis="white",col.lab="white",col.main="white",fg="white",bty="n",las=1,mar=c(4,3,2,3),family=family) #mono
      border=adjustcolor("purple",alpha=0.5)
    }else{
      colvec <<- bpy.colors(200) # plot window bg # USES <<- OPERATOR
      par(bg = colvec[1],col.axis="white",col.lab="white",col.main="white",fg="white",bty="n",las=1,mar=c(4,3,2,3),family=family) 
      border=adjustcolor("blue",alpha=0.5)
    }
  }else{
    #    graphics.off()
    par(bty="n",las=1,family=family) 
    colv<-"white"
  }
  # color palettes
  # ifelse(manuscript==1,colvec<-adjustcolor(brewer.pal(9,cp1)[9], alpha = alpha),colvec <- adjustcolor(brewer.pal(9,cp1)[5], alpha = alpha)) # fine tune plotting colors for plotting bg
  # colfunc <<- colorRampPalette(brewer.pal(9,cp1),alpha=alpha)
  cp1_info <- brewer.pal.info[cp1,]$maxcolors
  cp2_info <- brewer.pal.info[cp2,]$maxcolors
  colv <<- brewer.pal(cp1_info,cp1) # USES <<- OPERATOR
  colv2 <<- brewer.pal(cp2_info,cp2) # USES <<- OPERATOR
  # plot(1:max(cp1_info),pch=20,cex=3,col=colv,main="Colour pallete #1")
  par(mfrow=c(1,2))
  plot.new()
  legend("center",colv,fill=colv,cex=0.5,bty="n")
  plot.new()
  legend("center",colv2,fill=colv2,cex=0.5,bty="n")
  par(mfrow=c(1,1))
}

# Setting ggplot theme graphics
plot_it_gg <- function(bg,fg){ # bg = colour to plot bg, family = font family
  if(bg=="white"){
    bg <- "white"
    fg <- fg
  }
  if(bg=="blue"){
    colvec <- bpy.colors(200)
    bg <- colvec[1]
    fg <- fg
  }else{
    bg <- bg
    fg <- fg
  }
    theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
          panel.background = element_rect(fill = bg,colour = bg),
          plot.background = element_rect(fill=bg)) +
    theme(axis.line = element_line(color = fg)) +
    theme(axis.ticks = element_line(color = fg)) + 
    theme(plot.title = element_text(colour = fg)) +
    theme(text = element_text(family="serif")) +
    theme(axis.title.x = element_text(colour = fg), axis.title.y = element_text(colour = fg)) + 
    theme(axis.text.x = element_text(color = fg),axis.text.y = element_text(color = fg)) + 
    theme(legend.background=element_blank()) + # fills legend background for gg_themes
    theme(legend.box.background = element_rect(color = "transparent", fill = "transparent")) + 
    theme(legend.key = element_rect(color = "transparent", fill = "transparent")) + # for geom_lines legend
    theme(legend.title = element_text(colour=fg)) + 
    theme(legend.text = element_text(colour=fg)) +
    theme(strip.background  = element_blank()) +
    theme(strip.text = element_text(colour = fg)) # facet text colour for facet wrap
}# end gg