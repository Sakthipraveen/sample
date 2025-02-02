currentBuild.displayName = "Docker push # "+currentBuild.number

   def getDockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
        }


pipeline{
  agent any

  environment{
    Docker_tag = getDockerTag()
  }

  stages{
    stage('Quality Gate Statuc Check'){
      agent {
        docker {
          image 'maven:3-openjdk-11'
          args '-v $HOME/.m2:/root/.m2'
        }
      }
      steps{
        script{
          withSonarQubeEnv('sonar') {
            sh "mvn sonar:sonar"
          }
          timeout(time: 1, unit: 'HOURS') {
            def qg = waitForQualityGate()
            if (qg.status != 'OK') {
              error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
          }
        sh "mvn clean install"
        }
      }
    }

    stage('build'){
      steps{
        script{
          sh 'cp -r ../ansible_pipeline@2/target .'
          sh 'docker build . -t sakthipraveen/devops:$Docker_tag'
          withCredentials([usernamePassword(credentialsId: 'docker_password', passwordVariable: 'docker_password', usernameVariable: 'docker_username')])  {
            sh 'docker login -u $docker_username -p $docker_password'
            sh 'docker push sakthipraveen/devops:$Docker_tag'
          }
        }
      }
    }

    stage('ansible playbook'){
      steps{
        script{
          sh '''final_tag=$(echo $Docker_tag | tr -d ' ')
          echo ${final_tag}test
          sed -i "s/docker_tag/$final_tag/g"  ansible.yml
          '''
          sh 'pwd'
          sh 'ifconfig'
          sh 'ssh -tt ec2-user@35.154.18.243'

        ansiblePlaybook credentialsId: 'ansible', colorized: true, installation: 'ansible', inventory: '/home/ec2-user/sample/hosts', playbook: '/home/ec2-user/sample/ansible.yml'
        }
      }
    }
  }
}
