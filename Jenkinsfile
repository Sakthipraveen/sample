pipeline{
  agent any
  tools{
    maven 'Maven3'
  }

  stages{

    stage("Maven build"){
      steps{
        script{
          sh 'mvn clean package'
        }
      }
    }
  }
}
