pipeline {
    agent any
    triggers {
        pollSCM 'H/5 * * * *'
    }
    tools {
        nodejs "Default"
        dockerTool "Default"
    }
    
	environment {
		DOCKERHUB_CREDENTIALS = credentials('dockerhub')
	}
	
    stages {
        stage('Initialisation Compilation') {
            agent {
                docker { image 'node:20-alpine' }
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
                stage('Test') {
                    steps {
                        echo "Testing.."
                    }
                }
                stage('Package de l\'application') {
                    steps {
                        echo "Building.."
                        sh '''
                        npm run build
                        '''
                    }
                }
            }
        }
        stage('Construction docker') {
            stages {
                stage('Construction de l\'image') {
                    steps {
                        sh 'docker image build \
                        -t frontend:latest .'
                    }
                }
                stage('Login Docker Hub') {
                    steps {
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    }
                }
                stage('Docker Push') {
                    steps {
                        sh 'docker push frontend:latest'
                    }
                }
            }
        }
       
    }
}
