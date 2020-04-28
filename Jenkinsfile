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
            environment {
               BUILD_VERSION  = sh(script: 'date +%Y.%m.%d', , returnStdout: true).trim()
               COMMIT_VERSION = sh(script: 'git rev-parse --short HEAD', , returnStdout: true).trim()
            }
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
                            echo "###    DEPLOY - WARP RELEASE      ###"
                            echo "#####################################"
                            sh("pwd")
                            sh("ls -la")
                            if(params.deploy == 'release'){
                                sh("cat release/commit.sh.template | sed -e 's/COMMIT_VERSION/${COMMIT_VERSION}/' > .warp/lib/commit.sh")
                                sh("cat release/version.sh.template | sed -e 's/BUILD_VERSION/${BUILD_VERSION}/' > .warp/lib/version.sh")
                                sh("tar cJf warparchive.tar.xz .warp/.")
                                sh("cat warp > dist/warp")
                                sh("cat warparchive.tar.xz >> dist/warp")
                                sh("chmod +x dist/warp")
                                sh("cp dist/warp dist/warp_${BUILD_VERSION}")
                                sh("aws s3 cp ./dist/warp s3://ct.summasolutions.net/warp-engine/warp")
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
            slackSend channel: env.CHANEL_SLACK_WARP,
            color: 'good',
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }   
        failure {   
            echo "Failure!"   
            slackSend channel: env.CHANEL_SLACK_WARP,
            color: '#FF0000',
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }
        always {   
            dir("${WORKSPACE}") {
                deleteDir()
            }
            echo "delete temporary workspace"
        }
    }        
}