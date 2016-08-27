###########################################################################
##############   Ploting Financial Charts Using R #########################
###########################################################################

# The quantmod package is needed when ploting the charts

library(quantmod)
getSymbols("^GSPC",src="yahoo",from="2004-1-1",to="2016-1-1")

tail(GSPC)

GSPCClose <- Cl(GSPC)
# Cl function gave us the daily close data of S&P 500 Index


tail(GSPCClose)  

plot(GSPCClose)
# Plot the line chart of S&P 500 index for the given time period


chartSeries(GSPC)
# charSeries create the financial chart for the S&P 500 index

chartSeries(GSPCClose)  

###
###   Here, let's take a close look at the chartSeries function
# To plot the financial charts based on our needs, we can apply arguments such as name, type, and theme to 
# personalized our charts

# Let's take S&P 500 index as an example

chartSeries(GSPC,
            name="SP&500 Chart",
            type="candlesticks",
            subset="2012/2013",        #  time range  2012-1-1 ~ 2013-12-31
            TA=NULL,                   # not show the volume
            theme=chartTheme("white"))   # The theme is white

theme.white <- chartTheme("white")


names(theme.white)
# Based on the needs to changed the colors

theme.white$up.col <- "green"
theme.white$dn.col <- "red"
theme.white$border <- "lightgray"

chartSeries(GSPC,
            name="SP&500",
            type="candlesticks",
            subset="2013-6/",        # 2013-6 to up to date
            TA=NULL,     
            theme=theme.white) 

chartSeries(GSPC,
            name="SP&500",
            show.grid = T,           # show grid line
            type="candlesticks",
            subset="last 3 months",  # use text to describe the last three months data
            TA="addVo()",            # add the volume
            theme=theme.white)  

# Rechart
reChart(theme=chartTheme("black"),
        subset="last 6 months")  


chartSeries(GSPC,
            name="SP&500",
            show.grid = T,             
            type="candlesticks",
            subset="last 2 quarters",  # Use text
            TA="addVo();addSMA(20);addBBands(20,3)", # add indicators
            theme=theme.white)


# Use Zooom to zoom in the graph
# n means the times in zooming the graph
# eps means how many clicks the mouse hit for changes

zooom(n=1,eps=2)

# Simmilarily, we can use zoomchart to enlarge the data

zoomChart("2015")  # enlarge the 2015 data

zoomChart("2015-9")    # enlarge the 2015.9 data


# add indicator directly on the graph
addCCI(20)

