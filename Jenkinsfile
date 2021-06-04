currentBuild.displayName= "Jenkins "+ currentBuild.number


pipeline {
    agent any
    tools{
      maven 'Maven3'
    }
    stages {

        stage('build && SonarQube analysis') {
            steps {
                sh 'mvn clean install package'
            }
        }
    }
}
