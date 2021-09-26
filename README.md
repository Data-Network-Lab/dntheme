
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dntheme

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("Data-Network-Lab/DN_theme")
```

### Use dntheme:

Make sure to install the required fonts (instructions at the end of this
file).

``` r
library(dntheme)

d <- qplot(carat, data = diamonds[diamonds$color %in%LETTERS[4:7], ], geom = "histogram", bins=30, fill = color)
d
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Tech themes and scales:

``` r
d + theme_dn() + 
  scale_fill_dn() + 
  labs(title="Airbnb theme", 
       subtitle="now with subtitles for ggplot2 >= 2.1.0")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

Data Network color scales:

``` r
data("iris")

d1 <- qplot(x  = Sepal.Length, y =Sepal.Width,colour = Species,data = iris,geom = "point")
d1
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
d1 + theme_dn() + 
  scale_color_dn() + 
  labs(title="Airbnb theme", 
       subtitle="now with subtitles for ggplot2 >= 2.1.0")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

Tech geoms, inspired by [emoGG](https://github.com/dill/emoGG).

``` r
d2 <- data.frame(x = c(1:4, 3:1), y=1:7)
```

``` r
plot = ggplot(aes(x,y), data=d2) + 
  geom_dn(size=1.5, theme="google") + 
  theme_dn() +
  labs(
    x = "",
    y = "")

add_dn_titles(
    plot,
    title = "Let's have this logos up here",
    subtitle = "they look fun")
```

<!-- ```{r, eval=FALSE} -->
<!-- ggplot(aes(x,y), data=d2) +  -->
<!--   geom_tech(size=0.15, theme="etsy") +  -->
<!--   theme_tech("etsy")+ -->
<!--   ggtitle("Etsy geom") -->
<!-- ``` -->

### Install fonts:

You have to install the necessary fonts manually before using `ggtech`.
Mofidy the `destfile` if you are using Windows or Unix.

``` r
library(extrafont)

## Facebook 
download.file("http://social-fonts.com/assets/fonts/facebook-letter-faces/facebook-letter-faces.ttf", "/Library/Fonts/facebook-letter-faces.ttf", method="curl")

font_import(pattern = 'facebook-letter-faces.ttf', prompt=FALSE)


## Google 
download.file("http://social-fonts.com/assets/fonts/product-sans/product-sans.ttf", "/Library/Fonts/product-sans.ttf", method="curl")

font_import(pattern = 'product-sans.ttf', prompt=FALSE)


## Airbnb 
download.file("https://dl.dropboxusercontent.com/u/2364714/airbnb_ttf_fonts/Circular%20Air-Medium%203.46.45%20PM.ttf", "/Library/Fonts/Circular Air-Medium 3.46.45 PM.ttf", method="curl")

download.file("https://dl.dropboxusercontent.com/u/2364714/airbnb_ttf_fonts/Circular%20Air-Bold%203.46.45%20PM.ttf", "/Library/Fonts/Circular Air-Bold 3.46.45 PM.ttf", method="curl")

font_import(pattern = 'Circular', prompt=FALSE)


## Etsy 
download.file("https://www.etsy.com/assets/type/Guardian-EgypTT-Text-Regular.ttf", "/Library/Fonts/Guardian-EgypTT-Text-Regular.ttf", method="curl")

font_import(pattern = 'Guardian-EgypTT-Text-Regular.ttf', prompt=FALSE)


## Twitter 
download.file("http://social-fonts.com/assets/fonts/pico-black/pico-black.ttf", "/Library/Fonts/pico-black.ttf", method="curl")

download.file("http://social-fonts.com/assets/fonts/arista-light/arista-light.ttf", "/Library/Fonts/arista-light.ttf", method="curl")

font_import(pattern = 'pico-black.ttf', prompt=FALSE)
font_import(pattern = 'arista-light.ttf', prompt=FALSE)
```

## License

[(Back to top)](#table-of-contents)

Please visit the LICENSE.md file.

<!-- Add the footer here -->

![Footer](man/figures/footer.png)
