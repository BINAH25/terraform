pipeline {
  agent any

  stages {

    stage('Fetch code') {
      steps {
        git branch: 'main', url: 'https://github.com/BINAH25/terraform.git'
      }
    }

    stage('Terraform Init') {
      steps {
        echo '########################### Terraform Init ######################### '
        sh 'terraform init'
      }
    }

    stage('Terraform Format Check') {
      steps {
        echo '########################### Terraform Format ######################### '
        sh 'terraform fmt'
      }
    }

    stage('Terraform Validate') {
      steps {
        echo '########################### Terraform Validate ######################### '
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      steps {
        echo '########################### Terraform Plan ######################### '
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        echo '########################### Terraform Apply ######################### '
        sh 'terraform apply -auto-approve'
      }
    }

  }

  post {
    success {
      echo 'Terraform provisioning succeeded!'
    }
    failure {
      echo 'Terraform provisioning failed.'
    }
  }
}
