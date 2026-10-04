# Data

Raw data files are not tracked in this repository because of their size. To reproduce the full pipeline, place these two files in this folder:

1. **DR16Q_v4.fits**: SDSS DR16 Quasar Catalog, version 4.
   Download from the SDSS DR16Q page: https://www.sdss4.org/dr17/algorithms/qso_catalog/

2. **Star_Catalog.fit**: SDSS photometric stellar comparison sample.
   - Log in to SDSS CasJobs (https://skyserver.sdss.org/CasJobs/) and set the context to **DR16**.
   - Submit `SQL/Star_Catalog_Query.sql`. It writes the table `MyDB.Star_Catalog`.
   - Download that table as FITS and save it here as `Star_Catalog.fit`.

`SQL/Star_Selection_Cuts_Query.sql` reproduces the selection funnel in `Outputs/Star_Selection_Cuts.csv`.

Notebooks 02–04 can be run from the files in `Outputs/` without downloading either file.