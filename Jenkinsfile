pipeline {    
    agent {
        node{            
                label 'ansible-ci'
        }       
    }
    parameters {        
        choice(
            name: 'deploy',
            choices: ['release','documentation'],
            description: 'Choice option to Deploy'
        )
    }
    stages{ 
        stage('Deploy'){
            steps{
                script {
                    sshagent (credentials: ['BITBUCKET']){
                        withCredentials([
                            [
                                $class: 'AmazonWebServicesCredentialsBinding',
                                credentialsId: 'AWS_SUMMA_CREDENTIALS',
                                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                            ]
                        ]) 
                        {
                            sh 'AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}'
                            echo "#####################################"  
                            echo "###  DEPLOY - WARP TEST           ###"
                            echo "#####################################"
                            sh("pwd")
                            sh("ls -la")
                            if(params.deploy == 'release'){
                                //sh("sh deploy release")
                            }
                            if(params.deploy == 'documentation'){
                                //sh("sh deploy docs")
                            }                           
                        }
                    }
                }   
            }     
        }       
    }
    post {
        success {
            echo "Success!"   
            slackSend channel: env.CHANEL_SLACK,
            color: 'good',
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }   
        failure {   
            echo "Failure!"   
            slackSend channel: env.CHANEL_SLACK,
            color: '#FF0000',
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }
        always {   
            dir("${WORKSPACE}") {
                deleteDir()
            }
            echo "Eliminando..."
        }
    }        
}