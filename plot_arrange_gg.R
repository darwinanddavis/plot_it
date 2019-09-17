install.packages("pacman"); require(pacman)
p_load(ggplot2,gridExtra,ggpubr,colorspace,viridis,dplyr)

hcl_palettes()["type"]
qualitative_hcl(4, "Dark 3")

# useful grid egs
# http://www.sthda.com/english/articles/24-ggpubr-publication-ready-plots/81-ggplot2-easy-way-to-mix-multiple-graphs-on-the-same-page/

# legend
# https://stackoverflow.com/questions/13649473/add-a-common-legend-for-combined-ggplots

# num of plots in grid
# num of rows
# num of cols
# list of ggplot items
# directory to save to
plot_arrange_gg <- function(num_of_plots,rows_cols,plot_list,dir){

  ttl_list <- c("4-7 mm","8-10 mm", "12-15 mm", "18-22 mm")
  legend_pars <- pred_ps
  legend_ttl <- "Predator density"
  graphics.off()
  layout(matrix(c(1:6),layout[1],layout[2],byrow=T))
  gspl <- list() # empty list for storing final plots 
  global_sim_plot = list()
  for(be_event in 1:4){
    fh = paste0("algae_be",be_event,"_hostpop",init_host_pop,"_predpop",pred_p,".R")
    plot_outs = bio_list[fh]
    names(plot_outs) = pred_p /1000
    global_sim_plot[[be_event]] = plot_outs 
  }
  require(viridis)
  
  for(g in 1:length(global_sim_plot)){
    par(bty="n", las = 1)
    mm <- global_sim_plot[[g]]
    y_m <- melt(mm);y_m
    y_m$L1 <- y_m$L1 %>% as.numeric
    gspl[[g]] <- ggplot(data = y_m, 
                        aes(x = rep.int(1:length(mm[[1]]),length(unique((L1)))) , 
                            y = value, group = L1, colour=factor(L1))) +
      geom_point() +
      geom_line() +
      scale_color_manual(name=legend_ttl, # stupid ggplot legend @ggplotlegend  # http://r-statistics.co/Complete-Ggplot2-Tutorial-Part2-Customizing-Theme-With-R-Code.html
                         labels = legend_pars,
                         values = magma(length(mm))) +
      # scale_color_manual(name=legend_ttl, # stupid ggplot legend @ggplotlegend  # http://r-statistics.co/Complete-Ggplot2-Tutorial-Part2-Customizing-Theme-With-R-Code.html
      #                    labels = legend_pars,
      #                    values = 1:length(unique(y_m$L1))) +
      #linetype=y_m$L1) +
      theme_tufte() +
      theme(legend.position = "bottom") +
      labs(title=paste("",ttl_list[g]),x="",y="") + 
      if(g==length(global_sim_plot)){
        labs(x="Time") 
      }else{
        theme(legend.position="none")
      } 
  }
  # +  geom_text(x=,y=,label = max(value),check_overlap = T)
  
  bio_finalplots = do.call(grid.arrange,gspl) # plot in one window 
  ggsave("plots/inithost50.pdf",bio_finalplots,device="pdf",width=11,height=8.5)
  
}