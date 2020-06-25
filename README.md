# pypi


### Publishing packages

Install `poetry`
```
pip3 install poetry
```

Prepare `pyproject.toml` (Sample)
```
[tool.poetry]
name = "mylibrary"
version = "0.1.6"
description = "Utility functions"

authors = [
    "mavx <user@gmail.com>"
]

readme = "README.md"
repository = "https://github.com/mavx/mylibrary"
keywords = ["mylibrary"]

[tool.poetry.dependencies]
python = "^3.6" # Compatible python versions must be declared here
#toml = "^0.9"

# Dependencies
#requests

[tool.poetry.dev-dependencies]
pytest = "^3.0"
pytest-cov = "^2.4"

```

Publish package
```
export PYPI_INDEX=http://127.0.0.1:8080
export PYPI_REPO=YOUR_USERNAME
export PYPI_USER=$PYPI_REPO
export PYPI_PASSWORD=YOUR_HASHED_PASSWORD_HERE

poetry config repositories.$PYPI_REPO $PYPI_INDEX
poetry config http-basic.$PYPI_REPO $PYPI_USER $PYPI_PASSWORD
poetry publish -r $PYPI_REPO --build
```
