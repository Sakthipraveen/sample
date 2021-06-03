currentBuild.displayName= "Jenkins "+ currentBuild.number


pipeline{
  agent{
    docker{
      image 'maven:3-alpine'
      args '-v $HOME/.m2:$root/.m2'
    }
  }

  stages{
    stage('static code analysis and maven build'){
      steps{
        script{
          sh 'mvn clean install package'
        }
      }
    }
  }
}
