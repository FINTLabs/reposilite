pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'maven:3-openjdk-11'
          label 'docker'
        }
      }
      steps {
        dir('app') {
          git 'https://github.com/dzikoysk/reposilite.git'
          sh 'ls -l'
          sh 'mvn clean package'
        }
        stash includes: 'app/reposilite-backend/target/reposilite*.jar', name: 'jar'
      }
    }
    stage('Package') {
      agent { label 'docker' }
      steps {
        unstash 'jar'
        sh "docker build --tag ${GIT_COMMIT} ."
      }
    }
  }
}
