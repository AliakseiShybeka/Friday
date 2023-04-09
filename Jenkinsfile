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
                sh "apt-get update"
                sh "apt-get install curl python3-dev python3-pip python3-venv"
                sh "curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/1.4.2/install-poetry.py | python -"
                sh "poetry --version"
            }
        }

    }

}
