pipeline{
  agent any
  tools{
    maven 'maven3'
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
