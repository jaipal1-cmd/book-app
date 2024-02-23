pipeline {
    agent any

    environment {
        NODEJS_VERSION = '14' // Set the Node.js version you want to use
        DOCKER_IMAGE = 'jaipal1-cmd/book-app:main' // Set your Docker image name and tag
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Use Node.js Docker image to build
                    docker.image("node:${NODEJS_VERSION}")
                        .inside('-v $PWD:/app') {
                            sh 'cd /app && npm install'
                        }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run your tests here
                    docker.image("node:${NODEJS_VERSION}")
                        .inside('-v $PWD:/app') {
                            sh 'cd /app && npm test'
                        }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE}", '.')
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the Docker container
                    docker.withRegistry('https://registry.example.com', 'docker-credentials') {
                        sh "docker run -d --name book-app -p 80:3000 ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! You can add more post-build actions here.'
        }
        failure {
            echo 'Pipeline failed! You can add more post-build actions here.'
        }
    }
}
