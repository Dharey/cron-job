pipeline {
  agent any
	// trigger restart at 6:00 AM and 6:00 PM - Africa/Lagos Timezone
	triggers {
    cron('TZ=Africa/Lagos \n */15 * * * *') 
	}

  stages {
        stage("Install kubectl"){
            steps {
                sh """
                    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
                    chmod +x ./kubectl
                    ./kubectl version --client
                """
            }
        }

	stage('Execute restart pod script') {
          steps {
                withKubeConfig([credentialsId: 'k8scred']) {
                script {
					// steps {
					  // sh 'sudo su -' // Switch to root user
        	      sh 'pwd' // Print present working directory
        	      sh 'timeout 5m sh $PWD/restart_rb.sh' // Execute restart_rb shell script
                }
					}
				}
 			}
   }
}