pipeline {
    agent any
    triggers {
        pollSCM '*/5 * * * *'
        DOCKERHUB_CREDENTIALS = credentials('dh_cred')
    }
    tools {
        nodejs "Default"
    }
    stages {
        stage('Init') {
            steps {
                echo "Installing packages.."
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin''
                npm install --legacy-peer-deps
                npm install --save-dev karma --legacy-peer-deps
                npm install --save-dev karma-chrome-launcher --legacy-peer-deps
                '''
            }
        }
        stage('Build') {
            steps {
                echo "Building.."
                sh 'docker build -t frontend:latest .
                npm run build
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh 'docker push ismaeldn/frontend:$BUILD_ID'
            }
        }
    }
}