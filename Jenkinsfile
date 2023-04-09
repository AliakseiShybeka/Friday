def docker_tag = "master"
def docker_registry = "your-docker-registry-url"

pipeline {
    agent any

    options {
        timestamps()
    }

    environment {
        DOCKER_IMAGE = "my-flask-app"
        POETRY_VERSION = "1.2.0"
        PYTHON_VERSION = "3.9"
        IMAGE_TAG = "${env.BRANCH_NAME.toLowerCase()}"

        // Check if tag matches the pattern of a semantic version
        if (env.TAG_NAME ==~ /^\d+\.\d+\.\d+$/) {
            docker_tag = env.TAG_NAME
            IMAGE_TAG = docker_tag
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh "pip install --upgrade pip"
                sh "pip install poetry==${env.POETRY_VERSION}"
                sh "poetry install --no-root --no-interaction --no-ansi"
            }
        }

        stage('Pre-commit Checks') {
            steps {
                sh "poetry run pre-commit run --all-files"
            }
        }

        stage('Ruff Checks') {
            steps {
                sh "poetry run ruff check"
            }
        }

        stage('Build Docker Image') {
            when {
                allOf {
                    not { branch 'pull_request' }
                    anyOf {
                        branch 'master'
                        tag()
                    }
                }
            }
            steps {
                sh """
                    docker build \
                        --build-arg POETRY_VERSION=${env.POETRY_VERSION} \
                        --build-arg PYTHON_VERSION=${env.PYTHON_VERSION} \
                        -t ${env.DOCKER_IMAGE}:${env.IMAGE_TAG} \
                        .
                """
            }
        }

        stage('Push Docker Image') {
            when {
                allOf {
                    not { branch 'pull_request' }
                    anyOf {
                        branch 'master'
                        tag()
                    }
                }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo ${env.DOCKER_PASS} | docker login --username ${env.DOCKER_USER} --password-stdin ${docker_registry}
                        docker push ${docker_registry}/${env.DOCKER_IMAGE}:${env.IMAGE_TAG}
                    """
                }
            }
        }
    }
}
