def buildApp() {
    echo 'building the appliction'
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

def testingApp() {
    echo "Testing the application..."
}



def deployApp() {
    echo "Deploying the application..."
    withCredentials([usernamePassword(credentialsId: 'slhfs', usernameVariable: 'USER', passwordVariable: 'PWD')]) {
    echo "some script ${USER} ${PWD}"
}}

return this