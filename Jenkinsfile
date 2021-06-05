currentBuild.displayName = "Devops # "+currentBuild.number

pipeline {
    agent any
    tools{
      maven 'Maven3'
    }
    stages {

        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                  sh 'mvn sonar:sonar -Dsonar.projectKey=my-app -Dsonar.host.url=http://15.207.99.15:9000 -Dsonar.login=55fed880424f9979a2e428ffb3a26cacaf5f2528'

                }
                sh 'mvn clean install package'
            }
        }
        stage("Quality Gate") {
            steps {
              script{
                timeout(time: 1, unit: 'HOURS') {
                  def qg = waitForQualityGate(){
                    if (qg.status != true) {
                         error "Pipeline aborted due to quality gate failure: ${qg.status}"
                    }
                  }
                }

                }
            }
        }
    }
}
