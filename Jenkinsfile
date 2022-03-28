pipeline {
  agent { label "linux" }
  stages {
    stage("build") {
      steps {
        sh """
          docker build --rm -f "Dockerfile" -t vinorf:qa .
        """
      }
    }
    stage("run") {
      steps {
        sh """
          docker run --rm -v Test_Docker:/workspace:cached -w /workspace vinorf:qa python3 -m robot TestSuite
        """
      }
    }
  }
}