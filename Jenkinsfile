pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script {
                    sudo sh "docker build -t jaipal1-cmd/book-app:main ."
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    sudo sh 'docker run -d --name book-app -p 80:3000 jaipal1-cmd/book-app:main'
                }
            }
        }
    }+
