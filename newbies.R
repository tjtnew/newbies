initial_newbies_file <- "initial_newbies.RDS"
initial_time_file <- "initial_time.RDS"
dat_file <- "dat.csv"
readme_file <- "README.md"
url = "ftp://cran.r-project.org/incoming/newbies/"

newbies <- read.table(url(url))
newbies <- sub("\\.tar\\.gz", "", newbies$V9)
if (file.exists(initial_newbies_file)) {
  initial_dat <- readRDS(initial_newbies_file)
  initial_time <- readRDS(initial_time_file)
} else {
  initial_dat <- newbies
  initial_time <- sprintf(
    "started monitoring at %s\n\n",
    Sys.time()
  )
  saveRDS(initial_dat, file = initial_newbies_file)
  saveRDS(initial_time, file = initial_time_file)
}
newbies <- newbies[!newbies %in% initial_dat]

if (file.exists(dat_file)) {
  dat <- read.csv(
    dat_file, 
    colClasses = c(pkg = "character", count = "integer")
  )
} else {
  dat <- data.frame(pkg=character(), count = integer())  
}

if (length(newbies) > 0) {
  newbies_dat <- data.frame(pkg = newbies, count = 1)
  dat <- rbind(dat, newbies_dat)
  dat <- aggregate(count ~ pkg, data = dat, sum)
}

write.csv(dat, dat_file, row.names = FALSE)











