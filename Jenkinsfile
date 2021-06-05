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
          sh "mvn clean install package"

        }
      }
    }

  }
}
