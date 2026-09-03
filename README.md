# Redshift Evolution of SDSS Quasar Colors and Their Photometric Overlap with the Stellar Locus
Analysis of ~163,000 SDSS DR16Q quasars and ~1.9 million SDSS stars, quantifying 
how quasar-star color overlap changes with redshift. Using a grid-based retention 
metric with cross-validated uncertainty (binomial + bootstrap), the analysis 
reproduces the known z ≈ 2.7 quasar-star color degeneracy and shows it is most 
pronounced in color combinations involving u−g.

![Retention fraction](Figures/Quasar_Retention_Fraction_for_u-g_vs_r-i.png)

## Key Result
At the primary grid resolution, the retained quasar fraction in (u−g) vs (r−i) 
falls to ~0.54 at 2.5 < z ≤ 3.0, consistent with the well-known similarity between 
quasar colors and early F/late A stars near this redshift.

## Repository Structure
├── Notebooks/    Analysis pipeline (run in numbered order)
├── SQL/          CasJobs queries for the stellar catalog
├── Data/         Raw FITS files (not tracked — see Data/README.md)
├── Outputs/      CSV/NPZ intermediate and final results
├── Figures/      Generated figures

## Setup
pip install -r requirements.txt

## Data
Raw FITS files are not tracked in this repo. Download:
- DR16Q v4: https://www.sdss4.org/dr17/algorithms/qso_catalog/
- Stellar catalog: run SQL/star_catalog_query.sql via SDSS CasJobs

Place both files in Data/ before running the notebooks.

## Running the Pipeline
Run notebooks in order:
1. 01_Data_Selection.ipynb — sample selection and quality cuts
2. 02_Color_Evolution.ipynb — color-redshift statistics
3. 03_Stellar_Locus_and_Retention.ipynb — grid construction and retention fraction
4. 04_Selection_Efficiency_and_Robustness_Test.ipynb — sensitivity and bootstrap testing

## Citation
If you use this code, please cite [paper DOI once available].

## License
Code: MIT. Paper: CC-BY 4.0.