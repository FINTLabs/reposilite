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
    stage('Publish') {
      agent { label 'docker' }
      steps {
        unstash 'jar'
        sh "docker build --tag ${GIT_COMMIT} ."
        sh "docker tag ${GIT_COMMIT} fintlabsacr.azurecr.io/reposilite:latest"
        withDockerRegistry([credentialsId: 'fintlabsacr.azurecr.io', url: 'https://fintlabsacr.azurecr.io']) {
            sh "docker push fintlabsacr.azurecr.io/reposilite:latest"
        }
      }
    }
  }
}
