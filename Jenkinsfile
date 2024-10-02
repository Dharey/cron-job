pipeline {
  agent any
	// trigger restart at 6:00 AM and 6:00 PM - Africa/Lagos Timezone
	triggers {
    cron('TZ=Africa/Lagos \n "* * * * *"') 
	}
  options {
		skipStagesAfterUnstable()
		disableConcurrentBuilds()
		ansiColor('xterm')
		parallelsAlwaysFailFast()
  }
  stages {
		// stage('QA') {
		// 	when {
		// 		branch 'qa'
		// 	}
			// stages {
				stage('Execute restart pod script') {
     //      agent {
					// 	any
					// }
					steps {
					  // sh 'sudo su -' // Switch to root user
						sh 'pwd' // Print present working directory
						sh 'timeout 5m sh $PWD/restart_rb.sh' // Execute restart_rb shell script
					}
				}
 			}
        }
  // }
