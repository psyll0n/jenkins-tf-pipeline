def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS']]


pipeline {
    agent any

    options {
    disableConcurrentBuilds()
    parallelsAlwaysFailFast()
    timestamps()
    withCredentials(awsCredentials)
  }


    stages {
        stage("TF Init&Plan") { 
            steps { 
                sh 'terraform init'
                sh 'terraform plan'
            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply') {
            steps {
                sh "terraform apply -input=false tfplan"
            }
        }
    }
}

