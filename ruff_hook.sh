#!/usr/bin/env bash

poetry run ruff check $(git diff --name-only --cached --diff-filter=ACM | grep '\.py$')
