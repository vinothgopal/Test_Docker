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
          docker run --rm -v $(pwd):/workspace:cached -w /workspace vinorf:qa python3 -m robot TestSuite
        """
      }
    }
  }
}