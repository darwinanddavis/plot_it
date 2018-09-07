### set plotting params  
plot_it <- function(manuscript,bg,cp,alpha,family){ # plotting function (plot for MS or not, set bg color, set color palette from RColorBrewer, set alpha value for transperancy) 
  graphics.off()
  if(manuscript==0){
    if(bg=="black"){
      colvec<-magma(200,1)
      par(bg = colvec[1],col.axis="white",col.lab="white",col.main="white",fg="white",bty="n",las=1,mar=c(5,6,4,2),family=family) #mono
      border=adjustcolor("purple",alpha=0.5)
    }else{
      colvec<-bpy.colors(200)
      par(bg = colvec[1],col.axis="white",col.lab="white",col.main="white",fg="white",bty="n",las=1,mar=c(5,6,4,2),family=family) 
      border=adjustcolor("blue",alpha=0.5)
    }
  }else{
    #    graphics.off()
    par(bty="n",las=1,family=family) 
  }
  # color palettes
  # ifelse(manuscript==1,colvec<-adjustcolor(brewer.pal(9,cp)[9], alpha = alpha),colvec <- adjustcolor(brewer.pal(9,cp)[5], alpha = alpha)) # fine tune plotting colors for plotting bg
  # colfunc <<- colorRampPalette(brewer.pal(9,cp),alpha=alpha)
  colvec <- brewer.pal(11,cp)[1:3]
  colvec2 <- brewer.pal(11,cp)[9:11]
  colvec <<- c(colvec,colvec2) # USES <<- OPERATOR
}

# Setting ggplot theme graphics
plot_it_gg <- function(bg){ # bg = colour to plot bg, family = font family
  if(bg=="white"){
    bg <- "white"
    fg <- "black"
    theme_tufte(base_family = "HersheySans") +
      theme(panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_rect(fill = bg,colour = bg),plot.background = element_rect(fill=bg)) +
      theme(axis.line = element_line(color = fg)) +theme(axis.ticks = element_line(color = fg)) + theme(plot.title = element_text(colour = fg)) +theme(axis.title.x = element_text(colour = fg), axis.title.y = element_text(colour = fg)) + theme(axis.text.x = element_text(color = fg),axis.text.y = element_text(color = fg)) + theme(legend.key = element_rect(fill = bg)) + theme(legend.title = element_text(colour=fg)) + theme(legend.text = element_text(colour=fg))
  }
}# end gg