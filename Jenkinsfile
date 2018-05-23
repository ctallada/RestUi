def CONTAINER_NAME="sample"
def CONTAINER_TAG="latest"
def DOCKER_HUB_USER="rajugade"
def HTTP_PORT="8090"

node {

   /* stage('Initialize'){
        def dockerHome = tool 'MyDocker'
        def mavenHome  = tool 'MyMaven'
        env.PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }*/

    stage('Checkout') {
        checkout scm
    }

   /* stage('Build'){
       bat "mvn clean install"
    }

    stage('Sonar'){
        try {
            "mvn sonar:sonar"
        } catch(error){
            echo "The sonar server could not be reached ${error}"
        }
     }*/

    stage("Image Prune"){
        imagePrune(CONTAINER_NAME)
    }

    stage('Image Build'){
        imageBuild(CONTAINER_NAME, CONTAINER_TAG)
    }

    stage('Push to Docker Registry'){
        withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            pushToImage(CONTAINER_NAME, CONTAINER_TAG, USERNAME, PASSWORD)
        }
    }

    stage('Run App'){
        runApp(CONTAINER_NAME, CONTAINER_TAG, DOCKER_HUB_USER, HTTP_PORT)
    }
    

}

def imagePrune(containerName){
    try {
       bat "docker image prune -f"
       //bat "docker stop $containerName"
    } catch(error){}
}

def imageBuild(containerName, tag){
    bat "cd SpringKube"
    bat "docker build -t $containerName:$tag  -t $containerName --pull --no-cache ."
    echo "Image build complete"
}

def pushToImage(containerName, tag, dockerUser, dockerPassword){
    bat "docker login -u $dockerUser -p $dockerPassword"
    bat "docker tag $containerName:$tag $dockerUser/$containerName:$tag"
    bat "docker push $dockerUser/$containerName:$tag"
    echo "Image push complete"
}

def runApp(containerName, tag, dockerHubUser, httpPort){
    bat "docker pull $dockerHubUser/$containerName"
    bat "docker run -d --rm -p $httpPort:$httpPort --name $containerName $dockerHubUser/$containerName:$tag"
    echo "Application started on port: ${httpPort} (http)"
}
