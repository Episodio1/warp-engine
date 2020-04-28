pipeline {    
    agent {
        node{            
                label 'master'
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
                echo "#####################################"  
                echo "###          DEPLOY               ###"
                echo "#####################################"
                // comments 
                sh("echo 'Deploy test'")
            }       
        }       
    }        
}