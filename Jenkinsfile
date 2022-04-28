pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('nodejs')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/vikash123567/nodejs-demo.git'
            }
        }
    
        stage('Build') {
            steps {
                 sh 'npm install'
            }
        }

        stage('Approval ') {
            steps {
                input "deploy proceed?"
                }
        }


        stage('Build docker image') {
            steps {  
                sh 'docker build -t vikash456/nodejs .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push vikash456/nodejs'
            }
        }
        stage('Prod branch') {

            steps{
                script {
                    sh "docker run -d -p 3000:8080 --name nodejs-container nodejs"
                    }
                }
            }
        }

}

