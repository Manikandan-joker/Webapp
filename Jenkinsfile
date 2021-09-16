pipeline {
    agent none 
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-raja')
	}
    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'python:2-alpine' 
                }
            }
            steps {
                sh 'python -m py_compile app.py' 
                stash(name: 'compiled-results', includes: '*.py*') 
            }
        }
        

	    stage('Build') {

			steps {
				sh 'docker build -t app:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push app:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}
        
    }

   
