currentBuild.displayName= "Jenkins "+ currentBuild.number


pipeline{
  agent any
  tools{
    git 'git'
  }


  stages{

    stage('git integation'){
      steps{
        script{
          git url: 'https://github.com/Sakthipraveen/sample.git'
          sh 'echo hello'
        }
      }
    }
  }
}
