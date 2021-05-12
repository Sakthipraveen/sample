pipeline {
    agent any
    tools{
      maven 'Maven3'
      hudson.plugins.sonar.SonarRunnerInstallation 'sonar'
    }
    stages {

        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    // Optionally use a Maven environment you've configured already
                    withMaven(maven:'Maven3') {
                        sh 'mvn clean install -DskipTests=true sonar:sonar -Psonar'
                    }
                }
            }
        }
        //stage("Quality Gate") {
        //    steps {
        //        timeout(time: 1, unit: 'HOURS') {
        //            // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
        //            // true = set pipeline to UNSTABLE, false = don't
        //            waitForQualityGate abortPipeline: true
        //        }
        //    }
        //}
    }
}
