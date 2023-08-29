pipeline {
    agent any
    tools {
        maven 'maven'
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
                    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USER', passwordVariable: 'PWD')])
                    script {
                        echo "Logging into docker hub"
                        sh "echo ${PWD} | docker login -u ${USER} --password-stdin"
                        sh "docker push omarsala7/my-rep:myjvp1.0"
                }
            }
        }
    }
}
