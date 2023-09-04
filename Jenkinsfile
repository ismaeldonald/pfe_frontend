
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
	 
        stage('Init'){
            steps{
                // Permet l'authentification
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Test'){
            steps{
                // Démarre les tests unitaires
                sh 'make test'
            }
        }
        stage('Build'){
            steps {
                //Changer "epsdevops" avec votre username sur DockerHub
                sh 'docker build -t ismaeldn/frontend:$BUILD_ID -f build/Dockerfile .'
            }
        }
        stage('Deliver'){
            steps {
                //Changer "epsdevops" avec votre username sur DockerHub
                sh 'docker push ismaelddn/frontend:$BUILD_ID'
            }
        }
        stage('Cleanup'){
            steps {
                //Changer "epsdevops" avec votre username sur DockerHub
                sh 'docker rmi ismaeldn/frontend:$BUILD_ID'
                sh 'docker logout'
            }
        }
    }
}

