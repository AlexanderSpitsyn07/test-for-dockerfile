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
                    url: "https://github.com/AlexanderSpitsyn07/test-for-dockerfile"
            }
        }
        stage('TAG_TO_BUILD') {
            steps{
                withDockerRegistry(credentialsId: '2', url: 'https://index.docker.io/v1/' ) {
                sh '''export TAG_TO_BUILD="$(git describe --abbrev=0 --tags)" && docker build -t chehvostik/tarimage:$TAG_TO_BUILD . && docker push  chehvostik/tarimage:$TAG_TO_BUILD'''
              } 
            }     
        }
        stage('Checkout2') { //
            steps {
                git branch: 'master',
                   url: "https://github.com/AlexanderSpitsyn07/diplomchart" 
            }
       }  
       stage('Helm unpack') {
            steps {
                sh 'tar -xvf websrv-chart-0.1.0.tgz'
            }
        }
        stage('Helm upgrade') {
            steps {
              withKubeConfig([credentialsId: '3', serverUrl: "${CLUSTER_URL}"]) {
              sh 'helm upgrade --install websrv-chart websrv-chart/values.yaml --namespace kube-system'
              }
           }
       }  
    }
} 
