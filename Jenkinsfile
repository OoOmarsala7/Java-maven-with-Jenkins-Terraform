pipeline {
    agent any
    tools {
        maven 'maven'
    }
    environment {
        DOCKER_CREDENTIAL = credentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USER', passwordVariable: 'PWD')])
    }
    parameters {
        choice(name: 'ENV', choices: ['dev', 'test'])
    }
    stages {
        stage('build') {
            when {
                expression {
                    params.ENV == 'dev'
                }
            }
            steps {
                script {
                    echo "Building the application"
                    sh 'mvn package'
                }
            }
        }
        stage('docker') {
            steps {
                script {
                    echo "Building docker image"
                    sh 'docker build -t omarsala7/my-rep:myjvp1.0 .'
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo "Logging into docker hub"
                    sh "echo ${DOCKER_CREDENTIAL.getPWD()} | docker login -u ${DOCKER_CREDENTIAL.getUser()} --password-stdin"
                    sh "docker push omarsala7/my-rep:myjvp1.0"
                }
            }
        }
    }
}
