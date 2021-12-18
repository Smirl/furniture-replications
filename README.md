# Furniture Replications

[![Build Status](https://travis-ci.org/Smirl/furniture-replications.svg?branch=master)](https://travis-ci.org/Smirl/furniture-replications)

This is a port of the wordpress theme to hugo for furniturereplications.com

## Slider

The sliders on the home page were jquery scrollable but I was having issues.
I have moved them to [lightSlider](http://sachinchoolur.github.io/lightslider/).

## Featured

To add a featured image to the home page, create a `feature.jpg` in a product
content bundle. For example in
`content/products/tables/rise-and-fall/feature.jpg`. To add the link text, add
metadata to the page resource is the front matter of the product content bundle.
For example in `content/products/tables/rise-and-fall/index.md`:

    ---
    title: "Rise and Fall Table"
    resources:
    - title: "Unique Tables"
      src: "feature.jpg"
    ---
    ...

## Deployment

Deployment is to a kubernetes cluster. A few steps need to be done including
secret and service account set up. There are also manual deployment steps for
reference.

The helm chart used is a
[generic-app](https://artifacthub.io/packages/helm/mvisonneau/generic-app)
chart.

### Service Account

A service account is required to allow github-actions access. This is
created with:

```console
kubectl apply -f deploy/serviceaccount.yaml
```

### Github Actions

The `prod` environment needs to be set up with two secrets:

 - `K8S_URL` - url of kubernetes api server
 - `K8s_SECRET` - yaml content of the service account secret


### Secrets

The following secrets need to be in the deployment namespace.
 
    kubectl create secret generic amplify --from-literal=api_key=XXXXXXXX
