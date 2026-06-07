# Munich Bicycle Counter Patterns

This repository contains a Quarto project proposal for the StatProg2 group project.

## Group Members

| Name | GitHub username |
|------|-----------------|
| Shangxun Liu | lsx17 |
| Haoyu Meng | MHY112928 |
| Zihan Wang | Wzh927 |

## Dataset

The project uses the public Munich Open Data dataset "Daten der Raddauerzaehlstellen Muenchen".
- Dataset page: https://datengartln.de/datasets/detail/022a11ff-4dcb-4f03-b7dd-a6c94a094587/
- Licence: Datenlizenz Deutschland Namensnennung 2.0

For this proposal, we  downloaded the daily datasets for 2021 to 2024.

## Reproduce

1. The raw datasets for 2021-2024 (`bike_2021.csv` to `bike_2024.csv`) are stored in the `data/` folder.
2. Open the `proposal.qmd` file in RStudio.
3. Click the "Render" button in RStudio to generate the HTML report. All data combining and cleaning steps are done directly inside the QMD file using basic `dplyr` functions.

The rendered proposal is `docs/proposal.html` when built locally or through GitHub Pages.
