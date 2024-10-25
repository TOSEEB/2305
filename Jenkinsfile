
pipeline {
    agent any
    
    environment {
        
        ROLL_NO = 2305
        
        IMAGE_NAME = "docker-image"
    }

    stages {
        stage('Clone Repository') {
            steps {
               
                git branch: 'main', url: 'https://github.com/your-repository.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Remove Existing Container') {
            steps {
                script {
                  
                    sh """
                    if [ \$(docker ps -a -q -f name=${ROLL_NO}) ]; then
                        docker rm -f ${ROLL_NO}
                    fi
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                   
                    sh "docker run -d --name ${ROLL_NO} ${IMAGE_NAME}"
                }
            }
        }
    }

   
}