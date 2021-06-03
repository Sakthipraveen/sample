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
  }
}
