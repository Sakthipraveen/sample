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
      steps{
        environment{
          docker{
            image 'maven:3-alpine'
            args '$HOME/.m2:$ROOT/.m2'
          }
        }

        script{
          sh 'mvn clean install package'
        }
      }
    }
  }
}
