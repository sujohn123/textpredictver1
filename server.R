
library(wordcloud)
library(data.table)
setwd("f:/r")
newdat<-readRDS("newdat.RDS")

f<-function(c=character())
{
        a<-tolower(strsplit(c," ")[[1]][length(strsplit(c," ")[[1]])])
        g<-as.character(newdat[grep(paste0("^",a),bigram)][[1]][1:5])
        t<-(sapply(g,function(x)strsplit(x," ")[[1]][length(strsplit(x," ")[[1]])]))
        names(t)<-c(" "," "," "," "," ")
        t
        
        #wordcloud(word[1:5],c(100,50,20,10,5),colors=brewer.pal(5,"Dark2"))
        
}

f1<-function(c=character())

        {
        c=tolower(strsplit(c," ")[[1]][length(strsplit(c," ")[[1]])])
        tp<-ch[sapply(ch,function(x){strsplit(x,split=" ")[[1]][1] ==c})==TRUE]
        word<-sapply(tp,function(x){strsplit(x,split=" ")[[1]][2]})
        word<-as.character(word)        
        #word[1:5]
        wordcloud(word[1:5],c(100,50,20,10,5),colors=brewer.pal(5,"Dark2"))
}


shinyServer(
        function(input, output) {
                
                output$text <- renderPrint({f(input$t)})
                output$newplot<-renderPlot({
                        f1(input$t)
                })
        }
)



