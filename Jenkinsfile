pipeline {
    agent any

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepSt: '5')
        disableConcurrentBuilds()
    }

    stages {
        stage('Hello') {
            steps {
                echo "Hello"
            }
        }
    }

}
