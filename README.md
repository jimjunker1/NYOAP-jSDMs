
<!-- README.md is generated from README.Rmd. Please edit that file -->

------------------------------------------------------------------------

## Overview

This repository houses the analytical pipeline to support the project,
*Defining foraging hotspots of finfish and sharks in the New York Bight:
Linking trophic dynamics with spatiotemporal trends in species
distributions*.

### Purpose

This pipeline is used to summarise data of trawl species data, pull
environmental forecasts and backcasts of regional environmental
variables, fit species and community models of the biological community,
and forecast species biomasses/abundance to predict future sampling. The
general structure of the pipeline is shown below.

<div class="figure" style="text-align: center">

<img src="docs/model-pres_June2025.png" alt="General schematic of the analytical pipeline to predict species biomasses." width="70%" />
<p class="caption">

General schematic of the analytical pipeline to predict species
biomasses.
</p>

</div>

### Repository structure

The repository is structured to keep the workflow organized:

- code: This contains all the scripts to load and clean the biological
  and environmental data.

- data: This folder holds derived data output from functions. The raw
  trawl data is stored on a local Access database named,
  `Nearshore Survey.accdb`. This file must be placed in a local folder
  in the project root directory called, `ignore`. The `ignore` folder
  should be added to the `.gitignore` file to avoid corrupting the
  database during Git procedures. The `init.R` file contains a procedure
  to check that the file structure is correct.

- docs: This folder houses project documents and output reports to
  summarise models and forecasts

- ignore: This is a hidden local folder that houses the Access database.
  This should be included in the local project `.gitignore` so must be
  created by each user. See above for initiation checks in the `init.R`
  script.

### Database access

Once the database is correctly stored locally, access to the database is
managed by the [RODBC
package](https://cran.r-project.org/web/packages/RODBC/index.html). This
can be downloaded from CRAN using `install.packages("RODBC")`.

The connection to the database is set using

``` r
db <- odbcConnectAccess2007(here("ignore/Nearshore Survey.accdb"))
```

and all the available database tables with

``` r
sqlTables(db)
```

    #>           TABLE_NAME   TABLE_TYPE
    #> 1       CODE_SPECIES      SYNONYM
    #> 2  MSysAccessStorage SYSTEM TABLE
    #> 3      MSysAccessXML SYSTEM TABLE
    #> 4           MSysACEs SYSTEM TABLE
    #> 5 MSysComplexColumns SYSTEM TABLE
