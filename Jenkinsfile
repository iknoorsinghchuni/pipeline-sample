pipeline {
    agent any

      stages {
          stage('build') {
              steps {
                  echo 'building the software'
                  sh 'npm install'
              }
          }
          stage('test') {
              steps {
                  echo 'testing the software'
                  sh 'npm test'
              }
          }

          stage('deploy') {
              steps {
                withCredentials([sshUserPrivateKey(credentialsId: "jenkins-ssh", keyFileVariable: 'sshkey')]){
                  echo 'deploying the software'
                  sh '''#!/bin/bash
                  echo "Creating .ssh"
                  mkdir -p /var/lib/jenkins/.ssh
                  ssh-keyscan 192.168.1.144 >> /var/lib/jenkins/.ssh/known_hosts
                  
                  rsync -avz --exclude  '.git' --delete -e "ssh -i $sshkey" ./ devops@192.168.1.144:/app/
                 
                  ssh -i $sshkey devops@192.168.1.144 "sudo systemctl restart nodeapp"
                
                  '''
              }
          }
      }
    }
}

