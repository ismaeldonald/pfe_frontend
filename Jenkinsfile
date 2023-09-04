pipeline {
    agent any
    environment {
        // Ajouter la variable dh_cred comme variables d'authentification
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
       
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
                sh 'docker push ismaeldn/frontend:$BUILD_ID'
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

