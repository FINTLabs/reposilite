pipeline {
  agent { label 'docker' }
  stages {
    stage('Build') {
      steps {
        git 'https://github.com/dzikoysk/reposilite.git'
        sh 'ls -l'
      }
    }
  }
}
