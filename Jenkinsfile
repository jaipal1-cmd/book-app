pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        build(job: 'book-app', waitForStart: true)
      }
    }

    stage('depoy') {
      steps {
        readTrusted '/Dockerfile'
      }
    }

  }
}
