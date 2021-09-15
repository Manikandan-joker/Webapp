pipeline{
  agent none
  stages('Build'){
    agent{
      docker{
        image 'python:2-alpine'
      }
    }
    steps{
      sh 'python -m app.py'
  }
}
}
   
