#!groovy

node 
{
def urlscm          = 'http://gitlab.pulse:9081/pulse-infra/desafio-devops-parte01.git'
def envproject      = 'prod'
def registrylocal   = 'registry.pulse:5001'


    stage("SCM") 
    {
        checkout changelog: true, poll: true, scm: [
        $class: 'GitSCM',
        branches: [[name: "origin/master"]],
        doGenerateSubmoduleConfigurations: false,
        submoduleCfg: [],
        userRemoteConfigs: [[credentialsId: 'jenkins_gittlab', url: "${urlscm}"]]
        ]
    }
    
    stage('Build') 
    {
        dir('app') 
        {
            sh "mvn clean package"
        }
    }

    stage('Test') 
    {
        dir('app') 
        {
            sh "mvn test"
        }
    }

    stage('SONAR')
    {
        def pom             = readMavenPom file: 'app/pom.xml'
        dir('app') 
        {
            withSonarQubeEnv(credentialsId: 'jenkins-to-sonar') 
            {
                // sh 'mvn sonar:sonar ${pom.artifactId} ${pom.version} sonar-projetct.properties'
                sh 'mvn sonar:sonar -Dsonar.{pom.artifactId}Key=desafio-devops-parte01 -Dsonar.host.url=http://sonar.pulse:9082'
            }   
        }
    }

    stage('Qualidade do código') 
    {
        withSonarQubeEnv(credentialsId: 'jenkins-to-sonar')
        {
            timeout (unit: "MINUTES", time: 1){
                def qg = waitForQualityGate()
                if (qg.status != 'OK') {
                    error "Pipeline aborted due to quality gate failure: ${qg.status}"
                }
            }
            // timeout(time: 5, unit: 'MINUTES') 
            // {
            //     waitForQualityGate abortPipeline: true
            // }
        }
    }

    stage('Docker Build') 
    {
        def pom             = readMavenPom file: 'app/pom.xml'
        // def pv              = pom.version
        dir('app') 
        {
            sh "sudo docker build -t ${pom.artifactId}/${envproject}:${pom.version} . --no-cache"
            sh "sudo docker tag ${pom.artifactId}/${envproject}:${pom.version} ${registrylocal}/${pom.artifactId}:${pom.version}-${envproject}"
            sh "sudo docker tag ${pom.artifactId}/${envproject}:${pom.version} ${registrylocal}/${pom.artifactId}-${envproject}:latest"
            sh "sudo docker push ${registrylocal}/${pom.artifactId}:${pom.version}-${envproject}"
            sh "sudo docker push ${registrylocal}/${pom.artifactId}-${envproject}:latest"
        }
    }

    stage('Usando Ansible') 
    {
        def pom             = readMavenPom file: 'app/pom.xml'
        // def pv              = pom.version
        dir('conf/ansible')
        {
            sh "ansible-playbook -i inventory site.yaml -e 'versao=${pom.version} registryLOCAL=${registrylocal} artID=${pom.artifactId} envP=${envproject}'"


        }
    }
}

/* 
Testar uso de função para propriedades do POM

def getpomVersion(){

    def pom = readMavenPom file: 'app/pom.xml'
    //def pv  = pom.version
    return pom
}

*/