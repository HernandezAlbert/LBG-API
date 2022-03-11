pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
               sh 'docker build -t gcr.io/lbg-210222/api-albert:$BUILD_NUMBER .' -t gcr.io/lbg-210222/api-albert:latest .'
                
            }
        }
        stage('push to GVR') {
            steps {
                //
                    sh 'docker push gcr.io/lbg-210222/api-albert:$BUILD_NUMBER'       
                    sh 'docker push gcr.io/lbg-210222/api-albert:latest'
            }
        }
        stage('Reapply ') {
            steps {
                // 
                sh '''kubectl apply -f ./kubernetes/nginx.yaml
                kubectl apply -f ./kubernetes/api-deployment.yml
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
