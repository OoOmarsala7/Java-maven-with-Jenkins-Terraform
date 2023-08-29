#!/usr/bin/env groovy

pipeline {
    agent any
    environment {
        SERVER_CREDENTIALS = credentials('slhfs')
    }
    stages {
        stage('build') {
            steps {
                script {
                    echo "Building the application..."
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
                    echo "Deploying the application..."
                    withCredentials([usernamePassword(credentials: 'slhfs', usernameVariable: 'USER', passwordVariable: 'PWD' )]) 
                    {
                      sh "some scipt ${USER} ${PWD}"
                    }
                }

            }
        }
    }

