pipeline {
	agent any
    environment{
		nodejsHome = tool 'shabbirNodejs'
		PATH = "$nodejsHome/bin:$PATH"
	}
	stages{
        stage("Checkout"){
            steps{
                echo "I am the checkout stage"
            }
        }
		stage("Build & Compile"){
			steps{
                sh "npm i"
                sh "npm build"
			}
		}
		stage("Testing"){
			steps{
				echo "npm test"
			}
		}
		stage("Integration Test"){
			steps{
				echo "integration lol"
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
