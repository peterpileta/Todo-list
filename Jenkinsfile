pipeline {
     agent {
         docker {
             image 'maven:3.8.3-openjdk-11' //
             label 'docker'  //
         }
     }

    tools {
      maven 'Maven-3.8' //
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

        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/build/test-results/test/*.xml'
                }
            }
        }


        stage('Package') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    docker.build("${REGISTRY}:${IMAGE_TAG}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKER_PASSWORD')]) {
                    sh """
                        echo $DOCKER_PASSWORD | docker login -u your-dockerhub-username --password-stdin
                        docker push ${REGISTRY}:${IMAGE_TAG}
                    """
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                    kubectl set image deployment/${KUBE_DEPLOYMENT} todo-list=${REGISTRY}:${IMAGE_TAG} --record
                """
            }
        }

        stage('Performance Test') {
            steps {
                echo 'Running performance test using JMeter...'
                sh 'jmeter -n -t test/performance_test.jmx -l test/results.jtl'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up workspace...'
                cleanWs()
            }
        }
    }
}