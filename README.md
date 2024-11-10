## Project Setup

To get started with this project, you need to set up the environment and dependencies as described below.

### Prerequisites

- Helm must be installed on your system. Follow the [Helm Installation Guide](https://helm.sh/docs/intro/install/) for instructions.

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/askhat-zab/repo.git
   cd repo
   ```

2. **Create Helm Charts**

   ```bash
   helm create task-5-wordpress
   helm create task-5-mysql
   ```

3. **Package Charts**

   ```bash
   helm package task-5-wordpress
   helm package task-5-mysql
   ```

4. **Move Packages to Charts Directory**

   ```bash
   mv *.tgz charts/
   ```

5. **Update Helm Repository Index**

   ```bash
   helm repo index helm/charts --url https://askhat-zab.github.io/repo/helm/charts
   ```

6. **Add Helm Repository**

   ```bash
   helm repo add askhat-zab https://askhat-zab.github.io/repo/helm/charts
   ```

7. **List Helm Repositories**

   ```bash
   helm repo list
   ```

Follow these steps to set up your project, package the Helm charts, and add them to your Helm repository.
