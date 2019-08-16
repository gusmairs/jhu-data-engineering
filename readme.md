#### Data engineering project
This is an R course project for Johns Hopkins U. Develops scripts to read a zipped file of 300+ location sensor pollution data files, merge them based on parameters, and run descriptive statistics on them. Some notes:  
  - The `specdata.zip` file is stored locally away from the code repo, with the specific path held in a text file `data_path.txt` for various scripts to access. Change the path in one place when the data store changes
  - The [R code](/r-code) was fairly slow on this smallish dataset (15-20 seconds), mainly in file system access tasks. Tried Bash [shell scripts](/bash-code) to see how quick a direct script to manipulate the files would be (5-8x faster)
  - Ported the whole project to [Python](/pycode) as well, to compare code style and experiment with efficiency of the scripts to run this kind of file-based data manipulation (on par or faster than shell script).
