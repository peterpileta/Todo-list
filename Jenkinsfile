pipeline {
     agent {
         docker {
             image 'maven:3.8.3-openjdk-11' //
             label 'docker'  //
         }
     }

    tools {
      maven 'maven 3.8.3' //
    }

    environment {
        REGISTRY = 'your-dockerhub-username/todo-list'
        IMAGE_TAG = "${env.BUILD_NUMBER}"
        KUBE_DEPLOYMENT = 'todo-list-deployment'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/peterpileta/Todo-list.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }




        stage('Package') {
            steps {
                sh 'mvn clean package'
            }
        }




    }
}
