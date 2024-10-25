pipeline {
    agent any

    environment {
        ROLL_NO = 2305
        IMAGE_NAME = "docker-image"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/TOSEEB/2305.git'
            }
        }

        stage('Build Docker Image') {
            steps {
              
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Remove Existing Container') {
            steps {
               
                bat """
                docker ps -a -q -f name=${ROLL_NO} > nul
                if %errorlevel%==0 (
                    docker rm -f ${ROLL_NO}
                )
                """
            }
        }

        stage('Run New Container') {
            steps {
               
                bat "docker run -d --name ${ROLL_NO} ${IMAGE_NAME}"
            }
        }
    }
}
