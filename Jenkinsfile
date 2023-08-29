#!/usr/bin/env groovy

pipeline {
    agent any
    tools{
        maven 'maven'
    }
    parameters{
        string(name: 'verson', defaultValue: '')
        choice(name: 'version', choice['1.0','1.2','1.3'])
        
    }
    environment {
        SERVER_CREDENTIALS = credentials('slhfs')
    }
    stages {
        stage('build') {
            when{
                expression {
                    params.version == '1.0'
                    }
                }
            }
            steps {
                script {
                    echo "${params.versions} the application..."
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

