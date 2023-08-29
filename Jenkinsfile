pipeline {
    agent any
    tools {
        maven 'maven'
    }
    parameters {
        string(name: 'version', defaultValue: '')
        choice(name: 'versionChoice', choices: ['1.0', '1.2', '1.3'])
    }
    environment {
        SERVER_CREDENTIALS = credentials('slhfs')
    }
    stages {
        stage('build') {
            when {
                expression {
                    params.versionChoice == '1.0'
                }
            }
            steps {
                script {
                    echo "${params.versionChoice} the application..."
                }
            }
        }
        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo "Deploying the application..."
                    withCredentials([usernamePassword(credentialsId: 'slhfs', usernameVariable: 'USER', passwordVariable: 'PWD')]) {
                        echo "some script ${USER} ${PWD}"
                    }
                }
            }
        }
    }
}
