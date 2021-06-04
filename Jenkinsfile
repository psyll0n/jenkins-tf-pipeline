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
                sh 'terraform plan -out=tfplan -input=false'
            }
        }
         stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
           }
         }
       }
        stage('TF Apply') {
            steps {
                    sh 'terraform apply -input=false tfplan'
           }
        }
    }
 }
