pipeline {
    agent any
    triggers {
        pollSCM 'H/5 * * * *'
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
