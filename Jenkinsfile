pipeline {
    agent any
    stages {
        stage('Install dependencies ') {
            steps {
               sh 'npm install'
              
            }
        }
        stage('run test') {
            steps {
                //
               sh 'npm test'
            }
        }
        stage('build docker') {
            steps {
                //
                sh 'docker build -t lbg_app:$(env.BUILD_ID) .'
            }
        }
    }
}
