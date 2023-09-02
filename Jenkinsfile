#!/usr/bin/env groovy

@Library('Jenkins-shared-library')_

pipeline {
    agent any
    tools {
        maven 'maven'
    }
    
    parameters {
        choice(name: 'ENV', choices: ['dev', 'test'])
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

