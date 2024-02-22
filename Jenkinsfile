pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        script {
        build(job: 'book-app', waitForStart: true)
        def dockerImage = docker.build("jaipal1-cmd/book-app:main")
          docker.withRegistry('', 'demo-docker') {
                        dockerImage.push('main')
      }
    }    
  }   
}      
       stage('deploy') {
       steps {
         script {
                    sh 'docker pull jaipal1-cmd/book-app:main'
                    sh 'docker rm --force book-app'
                    sh 'docker rmi jaipal1-cmd/book-app:current'
                    sh 'docker tag jaipal1-cmd/book-app:main jaipal1-cmd/book-app:current'
                    sh 'docker run -d --name book-app -p 80:3000 jaipal1-cmd/book-app:current'
         }
       }
     }
   } 
 }
