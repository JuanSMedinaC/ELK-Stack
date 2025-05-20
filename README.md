
# Microservices Application with ELK Stack on Minikube

This project demonstrates the deployment of a microservices-based application alongside an ELK (Elasticsearch, Logstash, Kibana) stack for centralized logging, all running on a local Minikube cluster.

## Requirements

- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://www.docker.com/)
- Bash terminal

## Cluster Initialization

Before deploying any services, ensure that your Minikube cluster is reset and started with sufficient resources:

```bash
minikube stop
minikube delete
minikube start --memory=8192 --cpus=4
```

## Script Permissions

Ensure the deployment and management scripts are executable:

```bash
chmod +x config.sh elk-delete.sh elk-start.sh microservices-delete.sh microservices-start.sh
```

## Deployment Order

1. **Configure the environment and namespaces:**

   ```bash
   ./config.sh
   ```

2. **Create the JWT secret:**

   Replace `<secret>` with your actual secret key:

   ```bash
   kubectl create secret generic jwt-secret --from-literal=JWT_SECRET=<secret>
   ```

3. **Deploy the microservices:**

   ```bash
   ./microservices-start.sh
   ```

4. **Deploy the ELK stack:**

   ```bash
   ./elk-start.sh
   ```

5. **Expose LoadBalancer services (in a separate terminal):**

   ```bash
   minikube tunnel
   ```

## Accessing Elasticsearch

To inspect Elasticsearch logs or index data:

```bash
kubectl port-forward svc/elasticsearch 9200:9200 -n observability
```

Then open your browser and navigate to:

```
http://localhost:9200/_cat/indices?v
```

## Configuring Kibana

To access and configure Kibana:

```bash
kubectl port-forward svc/kibana 5601:5601 -n observability
```

Then open:

```
http://localhost:5601
```

Inside Kibana:

1. Open the **left menu**.
2. Go to **Stack Management**.
3. Under **Kibana**, choose **Index Patterns**.
4. Click **Create index pattern**.
5. Enter the name of the index created in Elasticsearch and follow the steps to complete setup.

## Notes

- Redis is used as a temporary storage for formatted logs from the `todos-api` microservice, which are consumed by Logstash and forwarded to Elasticsearch.
- All deployments use Kubernetes manifests with automation in mind, ensuring repeatable and consistent setups.

## Documentation Assistance

This documentation was created with the assistance of GPT to ensure clarity, completeness, and correctness throughout the setup process.
