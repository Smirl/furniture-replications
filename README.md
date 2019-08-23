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
