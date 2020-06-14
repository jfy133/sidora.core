[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Travis-CI Build Status](https://travis-ci.com/sidora-tools/sidora.core.svg?branch=master)](https://travis-ci.com/sidora-tools/sidora.core) [![Coverage Status](https://img.shields.io/codecov/c/github/sidora-tools/sidora.core/master.svg)](https://codecov.io/github/sidora-tools/sidora.core?branch=master)

# sidora.core

Functions to access and download tables of the MPI-SHH DAG Pandora database. Serves as backend for all sidora applications. 

## Install

You can install the development version from github:

```
if(!require('remotes')) install.packages('remotes')
remotes::install_github("sidora-tools/sidora.core")
```

## Quickstart

Load the package and establish a database connection to Pandora. To do so you need the right *.credentials* file

```
library(magrittr)
library(sidora.core)

con <- get_pandora_connection(".credentials")
```

You can access individual tables either by establishing a DBI connection (`get_con()`) to them or by downloading them as a data.frame (`get_df()`). You'll probably not need the former, which is only relevant if you want to interact with the database server directly.

`get_df()` does three additional things: It transforms the columns of the downloaded table to the correct data type (with `enforce_types()`), it adds a table name prefix to each column name and it caches the downloaded table locally. The default is a per-R-session cache, but you can cache more permanently by changing the `cache_dir` and `cache_max_age` parameters.

```
# get DBI connection
get_con("TAB_Site", con)
# get a local data.frame 
get_df("TAB_Site", con)
```

You can download multiple tables at once with `get_con_list()` and `get_df_list()`, which return a named list of objects. The latter again includes the additional transformation and caching features.

```
# get list of DBI connections
get_con_list(c(
  "TAB_Site", "TAB_Individual", "TAB_Sample", "TAB_Extract", "TAB_Library"
), con = con)
# get list of data.frames
df_list <- get_df_list(c(
  "TAB_Site", "TAB_Individual", "TAB_Sample", "TAB_Extract", "TAB_Library"
), con = con)
```

Some Pandora tables can be merged following a hierarchical, pair-wise logic of primary and foreign keys. `join_pandora_tables()` is a join function which is aware of this logic and automatically combines lists of data.frames with Pandora tables (as produced by `get_con_list()` or `get_df_list()`) to long data.frames.

```
jt <- join_pandora_tables(df_list)

get_df_list(c(
  "TAB_Site", "TAB_Individual"
), con = con) %>% join_pandora_tables()
```

## How do I load the 'development environment'

1. Clone this repository. 
2. Next you will need to create the `.credentials` file - please speak to the repository contributors for details.
3. Open Rstudio and go to File > Open Project and select the file 'sidora.core.Rproj' in the repository. 
4. Press `Ctrl` + `shift` + `b` to build the package and load the library. (alternatively, in the top right pane go to the 'Build' tab and press Install and Restart)
