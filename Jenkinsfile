currentBuild.displayName = "Docker push # "+currentBuild.number

   def getDockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
        }


pipeline{
  agent any

  environment{
    Docker_tag = getDockerTag()
  }

  stages{
    stage('Quality Gate Statuc Check'){
      agent {
        docker {
          image 'maven:3-openjdk-11'
          args '-v $HOME/.m2:/root/.m2'
        }
      }
      steps{
        script{
          withSonarQubeEnv('sonar') {
            sh "mvn sonar:sonar"
          }
          timeout(time: 1, unit: 'HOURS') {
            def qg = waitForQualityGate()
            if (qg.status != 'OK') {
              error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
          }
        sh "mvn clean install"
        }
      }
    }

    stage('build'){
      steps{
        script{
          sh 'docker build . -t sakthipraveen/devops:$Docker_tag'
          withCredentials([usernameColonPassword(credentialsId: 'docker', variable: 'docker')]) {
            sh 'docker login -u sakthipraveen -p $docker'
            sh 'docker push sakthipraveen/devops:$Docker_tag'
          }
        }
      }
    }
  }
}
