// pipeline {
//   agent any
// 	// trigger restart at 6:00 AM and 6:00 PM - Africa/Lagos Timezone
// 	triggers {
//     cron('TZ=Africa/Lagos \n * * * * *') 
// 	}
//   // options {
// 		// skipStagesAfterUnstable()
// 		// disableConcurrentBuilds()
// 		// ansiColor('xterm')
// 		// parallelsAlwaysFailFast()
//   // }
//   stages {
// 		// stage('QA') {
// 		// 	when {
// 		// 		branch 'qa'
// 		// 	}
// 			// stages {
// 				stage('Execute restart pod script') {
//      //      agent {
// 					// 	any
// 					// }
// 					steps {
// 					  // sh 'sudo su -' // Switch to root user
// 						sh 'pwd' // Print present working directory
// 						sh 'timeout 5m sh $PWD/restart_rb.sh' // Execute restart_rb shell script
// 					}
// 				}
//  			}
//         }
//   // }






pipeline {
  agent any
  triggers {
    cron('TZ=Africa/Lagos \n 0 6,18 * * *')  // Run at 6:00 AM and 6:00 PM
  }
  
  stages {
    stage('Execute restart pod script') {
      steps {
        // Check if kubectl is available
        sh 'which kubectl || echo "kubectl not found"'
        
        // Print working directory
        sh 'pwd'

        // Execute restart pod script with timeout
        sh 'timeout 5m sh $PWD/restart_rb.sh'
      }
    }
  }
}
