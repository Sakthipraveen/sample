currentBuild.displayName = "Final_Demo # "+currentBuild.number

   def getDockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
        }


pipeline{
  agent {
    docker {
      image 'maven'
      args '-v $HOME/.m2:/root/.m2'
    }
  }
  environment{
    Docker_tag = getDockerTag()
  }

  stages{
    stage('Quality Gate Statuc Check'){


      steps{
        script{
          withSonarQubeEnv('sonar') {
            sh "mvn install"
          }

        sh "mvn package"
        }
      }
    }

    stage('build docker'){
      steps{
        script{
          sh 'cp -r ../Dockerrization_job/target .'
          withCredentials([string(credentialsId: 'docker_password', variable: 'docker_password')]) {
            sh 'docker build . -t sakthipraveen/devops:$Docker_tag'
            sh 'docker login -u sakthipraveen -p $docker_password'
            sh 'docker push sakthipraveen/devops:$Docker_tag'
          }
        }
      }
    }
  }
}
