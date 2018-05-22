node{
    agent any
    stages{
stage('Initialize'){
    def dockerHome = tool 'MyDocker'
    def mavenHome  = tool 'MyMaven'
    env.PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
}
stage('Push to Docker Registry'){
    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        pushToImage(CONTAINER_NAME, CONTAINER_TAG, USERNAME, PASSWORD)
    }
}
    }
}
