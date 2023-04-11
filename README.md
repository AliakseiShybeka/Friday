## Project Dependencies Setup

This project requires several dependencies. The setup.sh shell script uses for automate this.

### Prerequisites
Before running the setup.sh script, ensure that the following are installed on your machine:

- Python 3
- Poetry
### Installation
To install the project dependencies, do this:

1. Clone the project repository to your local machine.
2. Navigate to the root directory of the project.
3. Run the **setup.sh** shell script by executing the following command: **./setup.sh.**


This will install all the project dependencies, including the virtual environment using Poetry, pre-commit hooks, and Ruff.

Main goal of this project was show how can it be possible to create simpe flask application and pack it inside docker container.

ruff is used as linter for GitHub hooks before every commit if you run setup.sh

main body of script is inside friday.py