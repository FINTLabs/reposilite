pipeline {
  agent { label 'docker' }
  stages {
    stage('Build') {
      steps {
        sh "docker build --tag ${GIT_COMMIT} ."
      }
    }
    stage('Publish') {
      steps {
        sh "docker tag ${GIT_COMMIT} fintlabsacr.azurecr.io/reposilite:latest"
        withDockerRegistry([credentialsId: 'fintlabsacr.azurecr.io', url: 'https://fintlabsacr.azurecr.io']) {
            sh "docker push fintlabsacr.azurecr.io/reposilite:latest"
        }
      }
    }
  }
}
