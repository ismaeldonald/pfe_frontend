pipeline {
    agent any
    triggers {
        pollSCM '*/5 * * * *'
    }
    tools {
        nodejs "Default"
    }
    stages {
        stage('Init') {
            steps {
                echo "Installing packages.."
                sh '''
                npm install --legacy-peer-deps
                npm install --save-dev karma --legacy-peer-deps
                npm install --save-dev karma-chrome-launcher --legacy-peer-deps
                '''
            }
        }
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
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
            }
        }
    }
}