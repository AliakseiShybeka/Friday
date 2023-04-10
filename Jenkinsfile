pipeline {
    agent any

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
        disableConcurrentBuilds()
    }

    stages {
        stage('Hello') {
            steps {
                echo "Hello"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh "poetry --version"
                sh "poetry install --no-root --no-interaction --no-ansi"

            }
        }

        stage('Pre-commit double-check') {
            steps {
                sh '''
                    files=$(git diff-tree --no-commit-id --name-only -r HEAD | grep '\\.py$')
                    if [ -n "$files" ]; then
                        poetry run ruff check $files
                    fi
                '''
            }
        }
    }

}
