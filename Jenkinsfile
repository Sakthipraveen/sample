currentBuild.displayName= "Jenkins "+ currentBuild.number


pipeline{
  agent any


  stages{

    stage('git integation'){
      steps{
        script{
          git url: 'https://github.com/Sakthipraveen/sample.git'
        }
      }
    }

    stage('static code analysis and maven build'){
      agent{
        docker{
          image 'maven:3-alpine'
          args '-v $HOME/.m2:$root/.m2'
        }
      }

      steps{
        script{
          sh 'mvn clean install package'
        }
      }
    }
  }
}
