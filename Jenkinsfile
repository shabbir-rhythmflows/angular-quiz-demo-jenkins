pipeline {
	agent {
        docker{
            image 'node:latest'
        }
    }
	stages{
        stage("Install"){
            steps{
                sh "npm --version"
                sh "npm install"
            }
        }
        stage("Test"){
            steps{
                // sh "npm test"
                echo "The testing takes place here"
            }
        }
        stage("Build"){
            steps{
                sh "npm run build"
            }
        }
	}
	post{
		always {
			echo "I run always. "
		}
		success {
			echo "I run when you are successful"
		}
		failure {
			echo "I run when you fail"
		}
		changed {
			echo "Status of build changed! Failure to success or success to failure"
		}
	}
}
