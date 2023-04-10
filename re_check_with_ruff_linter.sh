#!/bin/bash

files=$(git diff-tree --no-commit-id --name-only -r HEAD | grep '\.py$')
                    if [ -n "$files" ]; then
                        poetry run ruff check $files
                        else
    echo "No python files found to re-check with Ruff."
                    fi