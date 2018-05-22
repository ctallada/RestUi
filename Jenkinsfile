node("docker") {
    docker.withRegistry('https://hub.docker.com/', 'docker') {
    
        git url: "https://github.com/rajugade/KubeProj.git", credentialsId: 'github'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "SpringKube"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}
