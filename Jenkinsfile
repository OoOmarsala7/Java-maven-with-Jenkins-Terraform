
pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment{
        DOCKER_CREDENTIAL= credenttials([usernamePassword(credentialsId: 'docker',  usernameVariable: 'USER', passwordVariable: 'PWD')])
    }
    parameters{
        choice(name: 'EVN', choices:['dev', 'test'])
    }
    stages{
        stage ('build') {
            when{
                expression {
                    params.ENV == 'dev'
                }
                }
                steps{
                     script{
                         echo "building the application"
                          sh 'mvn package' 
            }
                }
                                                       
        }
        stage('docker') {
            steps{
                script{
                echo "building docker image"
                sh 'docker build omarsala78/my-rep:myjvp1.0 .'
            }  
            }  
        }
        stage('deploy') {
            steps{
                script{
                echo "logging into docker hub"
                sh "echo ${env.PWD} | docker login -u ${env.USER} --password-stdin"
                sh "docker push omarsala78/my-rep:myjvp1.0"
            } 
            }   
            }
            
        }

    }
