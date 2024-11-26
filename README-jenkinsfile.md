## Create Jenkinsfile

### Prerequisites

- Copy simple project https://spring.io/guides/topicals/spring-on-kubernetes

### Stages

1. **Clone the Repository**

   ```bash
   git clone https://github.com/askhat-zab/repo.git
   ```

2. **Build**

   ```bash
   mvn -ntp clean install -B -Dmaven.test.skip=true
   mvn -ntp package -B -Dmaven.test.skip=true
   ```

3. **Unit tests**

   ```bash
   mvn -ntp clean test -B
   ```

4. **SonarQube**

   Create accout in https://sonarcloud.io and create token

   ```bash
   mvn -ntp -B sonar:sonar -Dsonar.projectKey=askhat-zab_repo \
                                    -Dsonar.host.url=https://sonarcloud.io \
                                    -Dsonar.login=$SONAR_TOKEN \
                                    -Dsonar.organization=askhat-zab
   ```

5. **Dockerize**

   Create manual step using input

   ```bash
   kaniko/executor --snapshot-mode=redo --context `pwd` --dockerfile Dockerfile --destination $AWS_ECR:$IMAGE_TAG --cleanup
   ```

6. **Deploy**

   Create Helm chart using [README](README.md) and deploy

   ```bash
   helm repo add askhat-zab https://askhat-zab.github.io/repo/helm/charts
                    helm repo update
                    helm upgrade --install task-6-hello-spring-k8s askhat-zab/task-6-hello-spring-k8s \
                        --namespace task-6 \
                        --create-namespace \
                        --kubeconfig kube_config \
                        --set service.type=NodePort \
                        --set image.repository=$AWS_ECR \
                        --set image.tag=$IMAGE_TAG \
                        --atomic
   ```

8. **Smoke test**

   Install curl and check endpoint
 
   ```bash
   apk add --no-cache curl
   curl -s https://hello.itcorp.uk/actuator/health
   ```


9. **Alert**

   Add to Jenkins System options your creds of mail provider to view alerts in email.


10. **GitHub webhook**

   Install plugin GitHub in Jenkins.
   Add webhook in your app project to trigger Jenkins pipeline


