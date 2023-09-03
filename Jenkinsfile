#!/usr/bin/env groovy

@Library('Jenkins-shared-library')_



pipeline {
    agent any
    tools {
        maven 'maven'
    }
s    
    parameters {
        choice(name: 'ENV', choices: ['dev', 'test'])
        string(name: 'Image Name', defaultValue:'')
    }
    stages {
        stage('buildjar') {
            when {
                expression {
                    params.ENV == 'dev'
                }
            }
            steps {
                script {
                    buildJar()
                }
            }
        }
        stage('docker') {
            steps {
                script {
                    builddocker()
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    dockerpush()
                    }
                }
    }
}

    }

