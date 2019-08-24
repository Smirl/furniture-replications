# Furniture Replications

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

To deploy build the docker image, being sure to change the version:

    docker build -t registry.smirlwebs.com/smirl/furniture-replications:1.0.2 .

Login to the cluster:

    doctl kubernetes cluster kubeconfig save ...
    kubectl ns furniture-replications

If not already created, add the secrets:

    kubectl create secret docker-registry registry.smirlwebs.com --docker-server=registry.smirlwebs.com --docker-username=XXXXX --docker-password=XXXXXXX --docker-email=smirlie@googlemail.com
    
    kubectl create secret generic amplify --from-literal=api_key=XXXXXXXX

Then apply to kubernetes, again remember to change the version and commit:

    kubectl apply -f kubernetes.yaml
