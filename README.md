# newbies
Experimental scraping of incoming **newbies** to CRAN.

* started monitoring at ~ 2020-10-22 22:27:37
* Ended monitoring at ~ 2020-12-29 15:36:33
* CRAN submission is (was) offline from Dec 18, 2020 to Jan 4, 2021 (CRAN team vacation and maintainance work)
* [`dat.csv`](https://github.com/tjtnew/newbies/blob/master/dat.csv) is updated ~ hourly via a
  GitHub [Action](https://github.com/tjtnew/newbies/blob/master/.github/workflows/snapshot_newbies.yml)
  and an associated R [script](https://github.com/tjtnew/newbies/blob/master/newbies.R). It gives the 
  approximate number of hours that packages have been present in the **newbies** queue since monitoring
  began.
