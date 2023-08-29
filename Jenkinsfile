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
                    withCredentials([usernamePassword(credentialsId: 'slhfs', usernameVariable: 'USER', passwordVariable: 'PWD' )]) 
                    {
                      echo "some scipt ${USER} ${PWD}"
                    }
                }

            }
        }
    }

