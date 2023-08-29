def gv

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
        stage('init') {
            steps {
                script {
                    gv = load 'script.groovy'
                }
            }
        }
        stage('build') {
           
            when {
            expression {
                params.versionChoice == '1.0'
            }
        }
            steps {
                script {
                    
                    gv.buildApp()
                }
            }
        }
        stage('test') {
            steps {
                script {
                    gv.testingApp()
                }
            }
        }
        stage('deploy') {
            input{
                message "enter the enviroment to deploy to"
                ok "done"
                parameters{
                     choice(name: 'env', choices: ['dev', 'test'])
                }
            }
            steps {
                script {
                    echo "deploying to ${env}"
                    gv.deployApp()
                }
            }
        }
    }
}
