pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
               sh 'docker build -t alberthernandez2/api:$BUILD_NUMBER .'
                
            }
        }
        stage('push to GVR') {
            steps {
                //
                    sh 'docker tag api-albert-$BUILD_NUMBER gcr.io/lbg-210222/api:$BUILD_NUMBER'
                    sh 'docker push gcr.io/lbg-210222/api:$BUILD_NUMBER'
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
