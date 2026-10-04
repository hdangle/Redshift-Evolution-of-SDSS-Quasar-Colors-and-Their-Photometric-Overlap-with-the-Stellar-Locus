# Redshift Evolution of SDSS Quasar Colors and Their Photometric Overlap with the Stellar Locus

Analysis of 162,877 quality-selected SDSS DR16Q quasars and 1,854,084 SDSS point sources classified photometrically as `STAR` (with spectroscopically confirmed quasars removed). We trace the redshift evolution of (u−g), (g−r), (r−i), and (i−z), and measure the fraction of quasars whose colors lie outside a stellar-density mask in four color–color projections, testing its sensitivity to grid resolution and density threshold.

![Unmasked fraction in (u−g) vs (r−i)](Figures/Unmasked%20DR16Q%20Sample%20Fraction%20for%20u-g%20vs%20r-i.png)

## Key Result

Projections containing (u−g) generally show less overlap with the stellar locus than redder-only projections. In (u−g) vs (r−i), the unmasked fraction falls from 0.88–1.00 at z ≤ 2.5 to 0.57 at 2.5 < z ≤ 3 (grid n = 200, threshold T = 250), the redshift range where quasar colors are known to resemble those of A/F stars. Absolute values depend strongly on grid resolution and threshold.

The unmasked fraction is a descriptive overlap statistic for this DR16Q sample. It is **not** a measure of survey completeness, purity, or selection efficiency.

## Repository Structure

    ├── Data/        Raw FITS files (not tracked; see Data/README.md)
    ├── Figures/     Generated figures
    ├── Notebooks/   Analysis pipeline (run in numbered order)
    ├── Outputs/     CSV/NPZ intermediate and final results
    └── SQL/         CasJobs queries for the stellar catalog and its selection funnel

## Setup

    pip install -r requirements.txt

## Data

Raw FITS files are not tracked. To reproduce from scratch:

- DR16Q v4: [SDSS DR16Q](https://www.sdss4.org/dr17/algorithms/qso_catalog/)
- Stellar catalog: run `SQL/Star_Catalog_Query.sql` in SDSS CasJobs (DR16 context).

Place both files in `Data/`. Notebooks 02–04 can be run directly from the files in `Outputs/` without downloading the raw data.

## Running the Pipeline

1. `01_Data_Selection.ipynb`: sample selection and quality cuts
2. `02_Color_Evolution.ipynb`: color–redshift statistics
3. `03_Stellar_Locus_and_Retention.ipynb`: stellar-density grids and unmasked fraction with binomial uncertainty
4. `04_Uncertainty_Analysis_and_Robustness_Test.ipynb`: grid/threshold sensitivity and bootstrap

## Authors

Le Hai Dang
Hua Thanh Duy

## Contact

For questions regarding the analysis or repository, contact danglepvt@gmail.com.

## Acknowledgements

We thank the Haus der Astronomie and the Max Planck Institute for Astronomy for the opportunity to undertake this research through the International Summer Internship. We also thank Niall Deacon for his guidance, feedback, and valuable discussions.

This project makes use of data from the Sloan Digital Sky Survey (SDSS) and the Python packages Astropy, NumPy, pandas, and Matplotlib.

## Citation

If you use this code, please cite the [Zenodo record](https://doi.org/10.5281/zenodo.22283115).

## License

Code: MIT.
