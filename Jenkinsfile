currentBuild.displayName = "Devops # "+currentBuild.number

pipeline {
    agent any
    tools{
      maven 'Maven3'
    }
    stages {
      stage('sonar'){
        steps{
          script{
            withSonarQubeEnv('sonar') {
              sh "mvn sonar:sonar"
              }
            timeout(time: 1, unit: 'MINUTES') {

              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
            }
            sh "mvn clean install package"
        }
      }
    }
  }
}
