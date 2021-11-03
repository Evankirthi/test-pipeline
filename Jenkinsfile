pipeline{
     agent any
      environment {
         AZURE_SUBSCRIPTION_ID='4d2182ac-c521-4061-88a1-79628a1ac2a8'
         AZURE_TENANT_ID='6fecd065-cb31-41b4-985c-60f2fdf1720f'
         CONTAINER_REGISTRY='demoacr0427'
         RESOURCE_GROUP='rg-acr'
         REPO="turbo-frontend-service"
         IMAGE_NAME="turbo_frontend"
         TAG="tag"
     }
     stages{
        stage("Install packages"){
            steps{
                script{
                    echo 'Inside install packages'
                    sh "yarn install"
                }
            }

        }
         stage("test"){
            steps{
                script{
                    echo 'Inside test stage'
                    sh "yarn test"
                    }
                }
        }
         stage("Build"){
            steps{
                script{
                    echo 'Inside build stage'
                    sh "yarn build"
                    sh "docker build -t turbo_frontend ."
                }
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: '', passwordVariable: 'm3fw.CKrJMMP~c~nRGkhwYYkc8~4JG7dpr', usernameVariable: 'eb035e9a-fab9-4a1e-93c9-6e6135c654ec')]) {
                    sh 'az login --service-principal -u jenkins_admin -p admin@123! -t 6fecd065-cb31-41b4-985c-60f2fdf1720f'
                    sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
                    sh 'az acr login --name $CONTAINER_REGISTRY --resource-group $RESOURCE_GROUP'
                    sh 'az acr build --image $REPO/$IMAGE_NAME:$TAG --registry $CONTAINER_REGISTRY --file Dockerfile . '
                }
            }
        }
     }
 }

