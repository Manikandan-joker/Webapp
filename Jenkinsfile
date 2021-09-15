node{
  
  stage('Build'){
    agent{
      docker{
        image 'python:2-alpine'
      }
    }
    steps{
      sh 'python -m app.py
  }
}
}
   
