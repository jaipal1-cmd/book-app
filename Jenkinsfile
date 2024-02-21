pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        echo(job: 'book-app', waitForStart: true)
      }
    }
    stage('deploy') {
      steps {
        echo(readTrusted '/Dockerfile')
      }
    }

  }
}
