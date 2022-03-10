pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
               sh 'docker build -t alberthernandez2/api:$BUILD_NUMBER .'
                
            }
        }
        stage('push to docker hub') {
            steps {
                //
               sh 'docker push alberthernandez2/api:$BUILD_NUMBER'
            }
        }
        stage('Reapply ') {
            steps {
                // 
                sh '''kubectl apply -f ./kubernetes/nginx.yaml
                kubectl apply -f ./kubernetes/api-deployment.yaml
                '''
            }
        }
        stage('Cleanup ') {
            steps {
                // 
                sh 'docker system prune'
            }
        }
    }
}
