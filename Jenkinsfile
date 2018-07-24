node {
    properties([
    parameters([
    string(name: 'Version', defaultValue: '1', description: 'Build version', ),
    [$class: 'ExtensibleChoiceParameterDefinition',
    choiceListProvider:
     [$class: 'TextareaChoiceListProvider',
      addEditedValue: false, choiceListText: '''qa
dev
''', defaultChoice: 'qa'],
     description: 'Environment',
     editable: false,
     name: 'Env_name'
     ]])])

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

    def server = Artifactory.server 'art'
    def buildInfo = Artifactory.newBuildInfo()
    def downloadSpec = """{
     "files": [
       {
          "pattern": "laba/$Version/*.jar",
          "target": "target/"
        }
     ]
    }"""

   stage('Get build from Artifactory') {
      server.download(downloadSpec)
   }

    stage('Upload to regestry') {
          docker.withRegistry('http://docker-hub.local:5000') {
                  def testImage = docker.build("app:latest")
                  /* Push the container to the custom Registry */
                  testImage.push()
                            }
        }

            stage('Deploy to servres'){
            if (Env_name == "qa"){
            ansiblePlaybook(
                playbook: '/vagrant/qa.yml',
                inventory: '/vagrant/hosts'
            )
        } else{
            ansiblePlaybook(
                playbook: '/vagrant/dev.yml',
                inventory: '/vagrant/hosts'
        ) }
        }
 }
