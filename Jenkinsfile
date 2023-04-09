pipeline {
    agent any

    options {
        buildDiscarder logRorator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepSt: '5')
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
}
