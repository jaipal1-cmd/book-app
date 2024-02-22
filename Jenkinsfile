pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        script {
          sh docker.build("jaipal1-cmd/book-app:main")  
      }
    }    
  }   
}      
       stage('deploy') {
       steps {
         readTrusted 'dockerfile'
         script {
           sh 'docker run -d --name book-app -p 80:3000'
         }
       }
     }
   } 
