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
                sh "sudo curl -sSL https://install.python-poetry.org | python3 -"
                sh "sudo poetry --version"
                sh "sudo poetry install --no-root --no-interaction --no-ansi"

            }
        }

        stage('Pre-commit double-check') {
            steps {
                sh 'chmod +x ./re_check_with_ruff_linter.sh'
                sh './re_check_with_ruff_linter.sh'
            }
        }

        stage('Build Docker Image') {

            steps {
                sh """
                   sudo docker build .
                """
            }
        }

    }

}
