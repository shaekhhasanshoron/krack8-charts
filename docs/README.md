# Docs
## Creating Chart
### Creating New Helm Chart
Run the command from `srn@srn-O7:/mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8` directory
````
$ helm create helm-marketplace
````

### Update helmignore file

Since we will be keeping the package chart inside the `charts` folder under `helm-marketplace` directory where the `templates` folder already exists. So we have add the 
`charts/` folder to helmignore so that while packaging helm-marketplace, it doesnt copy the template twice (each deployment/secrets/configmaps.. will be generated twice). So thats
why we need to add the following to the `.helmignore` file under `helm-marketplace` directory.
```
charts/
.helmignore
```

### Packaging The chart
Creating the package and keeping inside `/mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8/helm-marketplace/charts` directory

Run the command from `srn@srn-O7:/mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8` directory
```
$ helm package helm-marketplace -d '/mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8/helm-marketplace/charts' --version "1.0.0"
```

### Indexing the chart

First create an `index.yaml` in the root directory

Now first index the `helm-marketplace` chart.

Run the command from `srn@srn-O7:/mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8` directory
```
$ helm repo index /mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8/helm-marketplace/charts/
```

It will create an index.yaml to the `/mnt/KloverCloud/klovercloud-opensource/krack8/charts/krack8/helm-marketplace/charts/` directory. Now copy the content and paste
it to the `index.yaml` file in the root directory.

## Apply the chart

```
helm repo add krack8-test https://shaekhhasanshoron.github.io/krack8-charts
```

```
helm template helm-agent --namespace klovercloud krack8-test/helm-marketplace --version 1.0.0
```