#!/bin/bash

# Install the project dependencies using poetry
poetry install

# Configure poetry to use an in-project virtualenv
poetry config virtualenvs.in-project true

# Create and activate the virtual environment
poetry shell

# Install pre-commit and the hooks
poetry run pre-commit install
