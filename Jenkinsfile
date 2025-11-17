pipeline {  
    agent any  
    environment {  
        DOCKERHUB_CREDENTIALS = credentials('docker-creds')  
    }  
    stages {  
        stage('checkout') {  
            steps {  
                echo "*********** cloning the code **********"  
                sh 'rm -rf usecase5 || true'  
                sh 'git clone https://github.com/siva2626/usecase5.git' 
            }  
        }   
        stage('Docker image build') {  
            steps {  
                echo "********** building is done ************"  
                dir('usecase5') {  
                    sh 'docker build -t siva2626/flask1:v1 .'  
                }  
            }  
        }
        stage('Push to Docker Hub') {  
            steps {  
                sh """  
                docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}  
                docker push siva2626/flask1:v1  
                """  
            }  
        }      
    }  
}  
             
