# Mutual Fund NAV Extractor

This project provides a shell script to extract the Scheme Name and Net Asset Value from the latest NAV data published by AMFI India. The script downloads the data, parses it, and outputs the results in both TSV and JSON formats for easy use in spreadsheets or programming.

## Features
- Downloads the latest NAV data from AMFI India
- Extracts only the Scheme Name and Net Asset Value columns
- Outputs data as both TSV (`output.tsv`) and JSON (`output.json`)
- Compatible with macOS and Linux

## Usage

1. **Clone or download this repository.**
2. **Run the extraction script:**

```sh
bash extract_nav.sh
```

This will:
- Download the latest `NAVAll.txt` from AMFI
- Extract the relevant columns
- Save the results as `output.tsv` and `output.json` in the current directory

## Output Files
- `output.tsv`: Tab-separated values with Scheme Name and Net Asset Value
- `output.json`: JSON array of objects with Scheme Name and Net Asset Value

## Requirements
- `bash`
- `curl`
- `awk`
- `python3`

These are available by default on most macOS and Linux systems.

## Customization
You can modify the script to extract additional columns or change the output format as needed. See `extract_nav.sh` for details.

## License
This project is provided for educational and personal use. Data is sourced from [AMFI India](https://www.amfiindia.com/).
