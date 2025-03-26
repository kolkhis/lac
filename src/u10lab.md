<div class="flex-container">
        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64"></img>
    <p>
        <h1>Unit 10 Lab - Kubernetes</h1>
    </p>
</div>

This lab focuses on installing, configuring, and deploying applications using Kubernetes (K3s).  
By the end of this lab, you will have:

- A working K3s Kubernetes cluster.
- Deployed and exposed a simple web application.
- Troubleshooted common Kubernetes deployment issues.

### Resources / Important Links

- [Killercoda Labs](https://killercoda.com/learn)
- [Kubernetes Documentation](https://kubernetes.io/docs/concepts/overview/)
- [K3s Official Site](https://k3s.io/)
- [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
- [Kubernetes Troubleshooting Guide](https://kubernetes.io/docs/tasks/debug/)

### Required Materials

- Rocky 9.3 – ProLUG Lab
- root or sudo command access

## Pre-Lab: Quick Warmup and System Checks

---

Before installing K3s, verify system compatibility and gather initial data.

### Step 1: Download and Inspect K3s Installer

```sh
curl -sfL https://get.k3s.io > /tmp/k3_installer.sh
more /tmp/k3_installer.sh
```

#### Questions:

- What system checks does the installer perform?
- What environment variables does it check?

### Step 2: System Architecture Check

```sh
uname -m
grep -i arch /tmp/k3_installer.sh
```

#### Questions:

- What is the variable holding the system architecture?
- How does K3s determine system compatibility?

### Step 3: SELinux Status Check

```sh
grep -iE "selinux|sestatus" /tmp/k3_installer.sh
sestatus
```

#### Questions:

- Does K3s check if SELinux is enabled?
- What are the implications of SELinux on Kubernetes deployments?

## Installing K3s and Verifying the Service

### Step 4: Install K3s

```sh
curl -sfL https://get.k3s.io | sh -
```

### Step 5: Verify Installation

```sh
systemctl status k3s
systemctl is-enabled k3s
```

- What files and services were installed?
- Is K3s set to start on boot?

### Step 6: Explore System Services

```sh
systemctl cat k3s
```

- What startup configurations does K3s have?
- Does it rely on any dependencies?

## Exploring Kubernetes Environment

### Step 7: Checking Kubernetes Components

```sh
kubectl version
kubectl get nodes
kubectl get pods -A
kubectl get namespaces
kubectl get configmaps -A
kubectl get secrets -A
```

#### Questions:

- What namespaces exist by default?
- What secrets are stored in the cluster?

## Deploying Applications: Pods, Services, and Deployments

### Step 8: Create a Simple Web Server Pod

```sh
kubectl run webpage --image=nginx
```

- Verify pod creation:
  ```sh
  kubectl get pods
  kubectl describe pod webpage
  ```

### Step 9: Deploy a Redis Database with Labels

```sh
kubectl run database --image=redis --labels=tier=database
```

- Verify labels:
  ```sh
  kubectl get pods --show-labels
  ```

### Step 10: Expose the Redis Database

```sh
kubectl expose pod database --port=6379 --name=redis-service --type=ClusterIP
```

- Verify service:
  ```sh
  kubectl get services
  ```

### Step 11: Create a Web Deployment with Replicas

```sh
kubectl create deployment web-deployment --image=nginx --replicas=3
```

- Check status:
  ```sh
  kubectl get deployments
  ```

### Step 12: Create a New Namespace and Deploy an App

```sh
kubectl create namespace my-test
kubectl create deployment redis-deploy -n my-test --image=redis --replicas=2
```

- Verify deployment:
  ```sh
  kubectl get pods -n my-test
  ```

## Troubleshooting Cluster Issues

Your team reports an issue with the cluster:

```sh
[root@Test_Cluster1 ~]# kubectl get nodes
NAME            STATUS      ROLES                AGE     VERSION
Test_Cluster1   Ready       control-plane,master 17h     v1.30.6+k3s1
Test_Cluster2   NotReady    worker               33m     v1.29.6+k3s1
Test_Cluster3   Ready       worker               17h     v1.28.6+k3s1
```

### Step 13: Investigate Node Health

```sh
kubectl describe node Test_Cluster2
kubectl get pods -A
```

- What errors do you notice?
- Is there a resource constraint or version mismatch?

### Step 14: Restart K3s and Check Logs

```sh
systemctl restart k3s
journalctl -xeu k3s
```

- What errors appear in the logs?
- Does restarting resolve the issue?

## Reflection and Additional Challenges

1. Deploy your own container:

   - Build a custom Docker container and deploy it in the cluster.
   - Ensure it’s secure and scalable.

2. Read about securing Kubernetes deployments:

   - [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
   - [Docker Security Best Practices](https://docs.docker.com/build/building/best-practices/)

3. Secure Kubernetes in Practice:

   - Try this security lab:  
      [Killercoda Kubernetes Security](https://killercoda.com/killer-shell-cks/scenario/static-manual-analysis-k8s)

## Conclusion

---

At the end of this lab, you should: ✅ Have a fully operational K3s Kubernetes cluster.  
✅ Be able to deploy and expose containerized applications.  
✅ Know how to troubleshoot common Kubernetes errors.  
✅ Understand security best practices for Kubernetes deployments.

📌 Next Steps: Continue testing deployments, set up monitoring tools like Prometheus or Grafana, and explore Ingress Controllers to manage external access.
## Downloads

#### - <a href="./assets/downloads/u10/u10_lab.pdf" target="_blank" download>📥 Download (`.pdf`)</a>

