pipeline {
	agent any 
    environment{
		dockerHome = tool 'shabbirDocker'
		PATH = "$dockerHome/bin:$PATH"
	}
	stages{
        stage("Install"){
            steps{
                sh "npm --version"
                sh "docker --version"
                // sh "npm install"
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
        
        stage("Build Docker Image") {
            steps {
                script {
                    imageName = "shabbirhythm/angular-demo-app:${env.BUILD_TAG.replaceAll("[^a-zA-Z0-9_.-]", "_")}"
                    docker.build(imageName)
                }
            }
        }

        stage("Push Docker Image"){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image("shabbirhythm/angular-demo-app:${env.BUILD_TAG}").push()
                        // docker.image("shabbirhythm/angular-demo-app:${env.BUILD_TAG}").push('latest')
                    }
                } 
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
