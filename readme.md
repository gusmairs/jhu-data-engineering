### Data engineering R/Python project
This is an R course project for Johns Hopkins U. Develops scripts to read a <a href='https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip'>zipped file</a> of 300+ location sensor pollution data files, merge them based on parameters, and run descriptive statistics on them. Some notes:  
  - The `specdata.zip` file is stored locally away from the code repo, with the specific path held in a text file `data_path.txt` for various scripts to access. Change the path in one place when the data store changes.
  - The [R code](/r-code) was fairly slow on this smallish dataset (15-20 seconds), mainly in file system access tasks. Tried Bash [shell scripts](/bash-code) to see how quick a direct script to manipulate the files would be (5-8x faster).
  - Ported the whole project to [Python](/pycode) as well, to learn code style differences and experiment with efficiency of Python methods to run this kind of file-based data manipulation (on par or faster than shell scripting).
  - Scripts in both R and Python are written to run interactively from the R command line or iPython, with `source()` in R to set up the tools, and `from pycode.xx import yy` in Python.
  - Added minimal production-level feedback to the R script set, but did not implement this in Python. Did not implement any error-catching code.
