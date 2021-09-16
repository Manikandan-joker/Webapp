pipeline {
    agent any 
    environment {
		DOCKERHUB_CREDENTIALS=credentials('jenkinsdata')
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
        

	    stage('dockerbuild') {

			steps {
				sh 'docker build -t joker111297/demo:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push joker111297/demo:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}
        
    }

   
