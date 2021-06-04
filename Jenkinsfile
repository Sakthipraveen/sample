currentBuild.displayName= "Jenkins "+ currentBuild.number


pipeline {
    agent any

    stages {
        stage('Git Integration') {
            steps {
                git url: 'https://github.com/Sakthipraveen/Jenkins'
            }
        }
    }
}
