pipeline {
    agent any
    tools{
      maven 'Maven3'
    }
    stages {

        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    // Optionally use a Maven environment you've configured already
                    withMaven(maven:'Maven3') {
                      script{
                        //sh 'mvn install -DskipTests=true sonar:sonar -Psonar'
                        mvn sonar:sonar \
                        -Dsonar.projectKey=Jenkins \
                        -Dsonar.host.url=http://127.0.0.1:9000 \
                        -Dsonar.login=b84c144ecbd38af693390f239414b4b68cc32ede
                      }
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
