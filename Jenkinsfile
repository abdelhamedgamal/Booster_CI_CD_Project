pipeline {
    agent any

    stages {
        stage('preparation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/abdelhamedgamal/Booster_CI_CD_Project.git'
            }
        }
        stage('Build') { 
            steps {
                sh  'docker build -f dockerfile . -t abdelhamedgamal/django_app:v1.1'
            }         
        }
        stage('artifact') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable:'pass', usernameVariable:'username')]){
                    sh 'docker login -u ${username} -p ${pass}'
                    sh 'docker push abdelhamedgamal/django_app:v1.1'
                }
            }
            
        }
    }   
}
