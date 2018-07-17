node {
    def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/nidzelska/CI-CD-demo'
      // Get the Maven tool.
      mvnHome = tool 'mvn'
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
   }
stage('Upload to artifactory') {
def server = Artifactory.server 'art'
def uploadSpec = """{
  "files": [
    {
      "pattern": "target/*.jar",
      "target": "laba/${BUILD_ID}/"
    }
 ]
}"""
server.upload(uploadSpec)
}

stage('Upload to regestry') {
       docker.withRegistry('http://localhost:5000') {
              def testImage = docker.build("jar-image:${env.BUILD_ID}")
              /* Push the container to the custom Registry */
              testImage.push()
          }
    }
   
   
   // stage('Results') {
   //   junit '**/target/surefire-reports/TEST-*.xml'
    //  archive 'target/*.jar'
   // }
   
}
