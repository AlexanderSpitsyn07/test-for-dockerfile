pipeline {
    agent any

    stages {
        stage('Docker version') {
            steps {
                sh "echo $USER"
                sh 'docker version'
            }
        }
        stage('Checkout') {
            steps{
                git branch: 'master',
                    url: 'https://github.com/AlexanderSpitsyn07/test-for-dockerfile'
            }
        }
        stage('Build docker image') {
            steps{
                    sh 'docker build -t chehvostik/tarimage:latest .' 
            }
        }
        stage ('Push image') {
            steps{
                withDockerRegistry(credentialsId: '2', url: 'https://index.docker.io/v1/' ) {
                sh '''
                   docker push chehvostik/tarimage:latest
                '''
                }
            }
        }
    }
} 
