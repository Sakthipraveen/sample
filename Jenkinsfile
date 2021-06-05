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
            timeout(time: 10, unit: 'MINUTES') {
              waitForQualityGate abortPipeline: true

            }
            sh "mvn clean install"
        }
      }
    }
  }
}
