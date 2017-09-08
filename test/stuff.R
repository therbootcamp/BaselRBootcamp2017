
setwd('~/Dropbox (2.0)/Work/Software/BaselRBootcamp2017/slides/D1S3_Data_IO/')

example_data = data.frame('id',sapply(1:100,function(x) paste0(sample(LETTERS,4), collapse = '')),
                     round(runif(100,0,2),2),round(rnorm(100,1,2),2))


d = matrix(rep(rnorm(1000000,0,1),10),ncol=10)

save(d,file='test1.RData')
saveRDS(d,'test1.RDS')
write_csv(as.data.frame(d),'test1.csv')


d = matrix(rep(rnorm(1000000,0,0),10),ncol=10)

save(d,file='test1.RData')
saveRDS(d,'test1.RDS')
write_csv(as.data.frame(d),'test1.csv')

d = as.data.frame(matrix(rep(rnorm(1000,0,1),10),ncol=10))

d = as_tibble(d)
