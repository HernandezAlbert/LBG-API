pipeline {
    agent any
    stages {
        stage('remove prev image') {
            steps {
             sh 'echo 'current build is $BUILD_NUMBER'
             sh 'echo 'prev build is $BUILD_NUMBER'
             sh '''if [ docker images gcr.io/lbg-210222/api-albert:$(($BUILD_NUMBER-1)) ] 
                   then              
                      docker rmi images gcr.io/lbg-210222/api-albert:$(($BUILD_NUMBER-1))
                '''
            }
        }
        stage('Build Image') {
            steps {
               sh 'docker build -t gcr.io/lbg-210222/api-albert:$BUILD_NUMBER  -t gcr.io/lbg-210222/api-albert:latest .'
                
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
                kubectl rollout restart deployment/api
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
