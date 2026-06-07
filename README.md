# Munich Bicycle Counter Patterns

This repository contains a Quarto project proposal for the StatProg2 group project.

## Group Members

| Name | GitHub username |
|------|-----------------|
| Shangxun Liu | lsx17 |
| Haoyu Meng | MHY112928 |
| Zihan Wang | Wzh927 |

## Dataset

The project uses the public Munich Open Data dataset "Daten der Raddauerzaehlstellen Muenchen - Jahreszahlen".

- Dataset page: https://opendata.muenchen.de/dataset/022a11ff-4dcb-4f03-b7dd-a6c94a094587/
- Datengartln page: https://datengartln.de/datasets/detail/022a11ff-4dcb-4f03-b7dd-a6c94a094587/
- Licence: Datenlizenz Deutschland Namensnennung 2.0

For the proposal, we use the daily bicycle-count files with weather variables for 2021-2024.

## Reproduce

1. Run `code/01_download.R` to download the raw CSV files into `data/raw/`.
2. Run `code/02_clean.R` to create `data/processed/bicycle_counts_clean.csv`.
3. Render the Quarto website with `quarto render`.

The rendered proposal is `docs/proposal.html` when built locally or through GitHub Pages.
