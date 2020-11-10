# nextflow-k8s
A (very simple) *getting-started* example for Nextflow kubernetes execution
that relies on access to a kubernetes cluster and a git-deployed workflow.

## Prerequisites
You must have access to a kubernetes cluster, i.e. the following command should
be successful, returning nodes in your cluster: -

  $ kubectl cluster-info
  kubernetes master is running at https://example.com
  [...]

...and a **namespace** with a service account that permits the
launching of Pods.
  
You will also need [nextflow]: -

    $ nextflow -version
    
      N E X T F L O W
      version 20.07.1 build 5412
      created 24-07-2020 15:18 UTC (16:18 BST)
      cite doi:10.1038/nbt.3820
      http://nextflow.io

## Execution
You will need a service account that permits the execution and
monitoring of Pods. The "default" service account will not be sufficient.
You can define the service account using a local configuration file, i.e.
create the following `nextflow.config` in your execution directory, replacing
`<SERVICE_ACCOUNT_NAME>` with a service account in your namespace: -

    k8s {
        serviceAccount = '<SERVCIE_ACCOUNT_NAME>'
    }

 
Now, with access to a Kubernetes namespace set it as the default namespace,
create a PVC and then run this nextflow project: -

    $ NAMESPACE=my-namespace
    $ kubectl config set-context --current --namespace=$NAMESPACE
    $ kubectl create -f pvc.yaml
    $ nextflow kuberun informaticsmatters/nextflow-k8s

---

[nextflow]: https://www.nextflow.io
