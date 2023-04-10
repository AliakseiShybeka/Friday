pipeline {
    agent any

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
        disableConcurrentBuilds()
    }

    environment {
        DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
        DOCKER_HUB_ACCESS_TOKEN = credentials('DOCKER_HUB_ACCESS_TOKEN')
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
                   sudo docker build -t myfridayapp:1.0 .
                """
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB_ACCESS_TOKEN', variable: 'DOCKER_HUB_ACCESS_TOKEN')]) {
                    sh """
                        echo "${DOCKER_HUB_ACCESS_TOKEN}" | docker login --username ${DOCKER_HUB_USERNAME} --password-stdin
                        docker push myfridayapp:1.0
                        
                    """
                }

            }
        }

    }

}
