# Census 31 eQ Lookup Suggestions Data

This repository contains TextField suggestion data source files used for versioned json files generation for census31-eq-questionnaire-runner.

## Source csv files

Source data files are provided by the business as single column csv files.

| Dataset                 | Description                                      |
|-------------------------|--------------------------------------------------|
| countries-of-birth.csv  | List of countries for country of birth questions |
| ethnic-groups.csv       | List of ethnic groups                            |
| languages.csv           | List of languages                                |
| national-identities.csv | List of national identities                      |
| passport-countries.csv  | List of countries for passport questions         |
| religions.csv           | List of religions                                |

These can be manually added/updated in this repository at `./source-data`

Separate source data files are provided for the Northern Ireland region at `./source-data/ni/en` and the non Northern Ireland (GB) region at `./source-data/gb`

For the GB region, separate source data files are provided for the Welsh and English language versions of the suggestions lists at `./source-data/gb/cy` and `./source-data/gb/en` respectively.

- source files to be provided by the business named for the above datasets

- files to be UTF-8 csv

- any values including commas should be double quoted

- data rows to contain lookup terms (as to be presented in the lookup lists)

## Front-end json files

json files generation from source csv files is automated on a new version release using GitHub actions and artifact of an archived folder in .zip format is published. To manually generate the files use `./scripts/convert_csv_to_json.py`.

- csv source file root directory `./source-data`

- json output file root directory `./data`

- two further levels of sub directories are expected corresponding to the `{region}` and `{language_code}` of the suggestions files respectively

## Code Linting/Formatting

We use [Megalinter](https://megalinter.io/latest/mega-linter-runner/) to maintain our code by running various linters over the different file types we have (except Python is done separately). This is run against PRs using the `mega-linter` GitHub action but can also be run locally. To run the linter locally you can run:

```shell
make megalint
```

This command will run all the linters enabled in the `mega-linter.yml` config file in the root of the repo against the all the files in the repo and report back any issues. This is run via docker and may take some time to run first time.
We also have another command which will also run Megalinter locally but this one will attempt to fix any issues it can rather than just report them.

```shell
make megalint-apply
```

Python linting and formatting is done separately to run the linting for that run:

```shell
make lint-python
```

This will run flake8 and black over the python files.

And for formatting:

```shell
make format-python
```

This will run black and isort over the python files.
