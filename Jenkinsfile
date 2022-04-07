pipeline{
    agent any
    environment {
        imageName = "my-sample-go-jenkins"
        containerName = "sample-go-jenkins"
        branch = "master"
        scmUrl =  "https://github.com/jutionck/sample-go-jenkins.git"
    }
    stages {
        stage("Cleaning up") {
            steps {
                echo 'Cleaning up'
                sh 'docker rm -f "${containerName}" || true'
            }
        }

        stage("Clone Source") {
            steps {
                echo 'Clone Source'
                git branch: "${branch}", url: "${scmUrl}"
            }
        }

        stage("Docker build") {
            steps {
                echo 'Compiling and building'
                sh 'docker build -t "${imageName}" .'
            }
        }

        stage("Docker run") {
            steps {
                echo 'Go run'
                sh 'docker run --name "${containerName}" ${imageName}'
            }
        }

        stage("Docker run test") {
            steps {
                echo 'Go test'
                sh 'docker run --name "${containerName}" ${imageName} sh -c "go test"'
            }
        }
    }
}